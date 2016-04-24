

/*
We take 11 joints from the kinect, which are as follows
 0: HandLeft;
 1: HandRight;
 2: FootLeft;
 3: FootRight;
 4: Head;
 5: SpineMid;
 6: SpineBase;
 7: KneeLeft;
 8: KneeRight;
 9: ShoulderLeft;
 10: ShoulderRight;
 */

//import libraries for kinect2
import KinectPV2.KJoint;
import KinectPV2.*;


//declare new kinect object
KinectPV2 kinect;

//declare new array for joints
KJoint[] joints;

//declare new int for index of current joint
int trailingJointIndex;

//declare array for storing the skeletons
ArrayList<KSkeleton> skeletonArray = new ArrayList<KSkeleton>();

//declare array for storing the joint positions
ArrayList<PVector> trailingJointPositions = new ArrayList<PVector>();

//we need 11 of all the kinect joints
int jointsNum = 10;
//WHAT IS THIS?
int kinectScaling = 500;

//function for setting up the kinect
void setupKinect() {
  //constructor method of KinectPV2 class
  kinect = new KinectPV2(this);
  //enable 3D skeleton
  kinect.enableSkeleton3DMap(true);
  //initialize the streaming of data
  kinect.init();
}


void updateKinectSkeletons() {

  pushMatrix();
  translate(width/2, height/2, 0);
  scale(kinectScaling, kinectScaling, 1);
  rotateX(PI);
  //flip the x positions, so we can perform in between the Kinect and the wall
  rotateY(PI);


  skeletonArray = kinect.getSkeleton3d();
  if (skeletonArray.size() > 0) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(0);
    if (skeleton.isTracked()) {
      joints = skeleton.getJoints();      


      // Get the index number for the joint
      //each index represents one joint
      for (int i = 0; i<jointsNum; i++) {
        int trailingJointIndex = getTrailingJointIndex(i);
        // Retrieve the joint using the index number
        KJoint trailingJoint = joints[trailingJointIndex];
        // Get the PVector containing the xyz position of the joint
        trailingJointPositions.add(trailingJoint.getPosition().copy());
      }

      //keep only the current frame of joints in storage
      while (trailingJointPositions.size()>(jointsNum+1)) {
        trailingJointPositions.remove(0);
      }

      //Draw all the joints
      stroke(255);
      strokeWeight(5);
      drawJoints();
    }
  }
  popMatrix();
}



int getTrailingJointIndex(int index) {

  if (index == 0) {
    return KinectPV2.JointType_HandLeft;
  } else if (index == 1) {
    return KinectPV2.JointType_HandRight;
  } else if (index == 2) {
    return KinectPV2.JointType_FootLeft;
  } else if (index == 3) {
    return KinectPV2.JointType_FootRight;
  } else if (index == 4) {
    return KinectPV2.JointType_Head;
  } else if (index == 5) {
    return KinectPV2.JointType_SpineMid;
  } else if (index == 6) {
    return KinectPV2.JointType_SpineBase;
  } else if (index == 7) {
    return KinectPV2.JointType_KneeLeft;
  } else if (index == 8) {
    return KinectPV2.JointType_KneeRight;
  } else if (index == 9) {
    return KinectPV2.JointType_ShoulderLeft;
  } else if (index == 10) {
    return KinectPV2.JointType_ShoulderRight;
  } else {
    return 5;
  }
}



void drawJoint(int jointType) {
  KJoint joint = joints[jointType];
  PVector jointPosition = joint.getPosition();
  point(jointPosition.x, jointPosition.y, jointPosition.z);
}

void drawJoints() {
  //Bust
  drawJoint(KinectPV2.JointType_Head);
  drawJoint(KinectPV2.JointType_Neck);
  drawJoint(KinectPV2.JointType_SpineShoulder);

  //Torso
  drawJoint(KinectPV2.JointType_SpineMid);
  drawJoint(KinectPV2.JointType_SpineBase);

  // Right Arm    
  drawJoint(KinectPV2.JointType_ShoulderRight);
  drawJoint(KinectPV2.JointType_ElbowRight);
  drawJoint(KinectPV2.JointType_WristRight);
  drawJoint(KinectPV2.JointType_HandRight);
  drawJoint(KinectPV2.JointType_HandTipRight);
  drawJoint(KinectPV2.JointType_ThumbRight);

  // Left Arm
  drawJoint(KinectPV2.JointType_ShoulderLeft);
  drawJoint(KinectPV2.JointType_ElbowLeft);
  drawJoint(KinectPV2.JointType_WristLeft);
  drawJoint(KinectPV2.JointType_HandLeft);
  drawJoint(KinectPV2.JointType_HandTipLeft);
  drawJoint(KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawJoint(KinectPV2.JointType_HipRight);
  drawJoint(KinectPV2.JointType_KneeRight);
  drawJoint(KinectPV2.JointType_AnkleRight);
  drawJoint(KinectPV2.JointType_FootRight);

  // Left Leg
  drawJoint(KinectPV2.JointType_HipLeft);
  drawJoint(KinectPV2.JointType_KneeLeft);
  drawJoint(KinectPV2.JointType_AnkleLeft);
  drawJoint(KinectPV2.JointType_FootLeft);
}