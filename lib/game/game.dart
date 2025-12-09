import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget.controlled(gameFactory: ctosGame.new);
  }
}

class ctosGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    final map = await TiledComponent.load('ctosmap.tmx', Vector2.all(16));
    await add(map);
  }
}
