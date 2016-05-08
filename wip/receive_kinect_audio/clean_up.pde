
void sendFingerPositions() {

  String dimension = "";

  for (int i = 0; i < 3; i++) {


    if (i == 0) {
      dimension = "/x";
    } else if (i == 1) {
      dimension = "/y";
    } else if (i == 2) {
      dimension = "/z";
    }
    for (int j = 0; j < 10; j++) {

      //left hand
      if (j < 5) {

        String message = "/hands" + "/left" + dimension;

        switch(j) {
        case 0:
          message = message + "/thumb";
          break;
        case 1:
          message = message + "/index";
          break;
        case 2:
          message = message + "/middle";
          break;
        case 3:
          message = message + "/ring";
          break;
        case 4:
          message = message + "/pinky";
          break;
        }

        OscMessage myMessage = new OscMessage(message);
        myMessage.add(fingers_position[i][j]);
        oscP5.send(myMessage, oscToMax);
      }

      //right hand
      else {
        String message = "/hands" + "/right" + dimension;

        switch(j) {
        case 5:
          message = message + "/thumb";
          break;
        case 6:
          message = message + "/index";
          break;
        case 7:
          message = message + "/middle";
          break;
        case 8:
          message = message + "/ring";
          break;
        case 9:
          message = message + "/pinky";
          break;
        }

        OscMessage myMessage = new OscMessage(message);
        myMessage.add(fingers_position[i][j]);
        oscP5.send(myMessage, oscToMax);
      }
    }
  }
}

void sendHandRoll() {

  String message;

  //iterate through every hand available
  for (int i = 0; i < hands_roll.length; i++) {

    // left hand roll
    if (i < 1) {
      message = "/hands" + "/left" + "/roll";
    }

    // right hand roll
    else {
      message = "/hands" + "/right" + "/roll";
    }

    OscMessage myMessage = new OscMessage(message);
    myMessage.add(hands_roll[i]);
    oscP5.send(myMessage, oscToMax);
  }
}

void sendHandPitch() {

  String message;

  //iterate through every hand available
  for (int i = 0; i < hands_pitch.length; i++) {

    // left hand roll
    if (i < 1) {
      message = "/hands" + "/left" + "/pitch";
    }

    // right hand roll
    else {
      message = "/hands" + "/right" + "/pitch";
    }

    OscMessage myMessage = new OscMessage(message);
    myMessage.add(hands_pitch[i]);
    oscP5.send(myMessage, oscToMax);
  }
}

void sendHandYaw() {

  String message;

  //iterate through every hand available
  for (int i = 0; i < hands_yaw.length; i++) {

    // left hand roll
    if (i < 1) {
      message = "/hands" + "/left" + "/yaw";
    }

    // right hand roll
    else {
      message = "/hands" + "/right" + "/yaw";
    }

    OscMessage myMessage = new OscMessage(message);
    myMessage.add(hands_yaw[i]);
    oscP5.send(myMessage, oscToMax);
  }
}

void sendHandPosition() {

  String message;
  message = str(hands_distance);

  OscMessage myMessage = new OscMessage(message);
  myMessage.add(hands_distance);
  oscP5.send(myMessage, oscToProcessing);
}