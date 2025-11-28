import 'package:audioplayers/audioplayers.dart';

Future<void> replay_sound()async{
  final AudioPlayer audioPlayer = AudioPlayer();
  try {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource('sound/hack_sound.mp3'));
  } catch (e) {
    print(e);
  }
}