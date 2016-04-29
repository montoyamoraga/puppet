/*
We take 10 joints from the kinect, which are as follows
 0: Head;
 1: SpineBase;
 2: KneeLeft;
 3: KneeRight;
 4: HandLeft;
 5: HandRight;
 6: HandTipLeft
 7: HandTipRight
 8: ThumbLeft
 9: ThumbRight
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

//we need 10 of all the kinect joints
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
    }
  }
  popMatrix();
}

int getTrailingJointIndex(int index) {


  /*
We take 10 joints from the kinect, which are as follows
   0: Head;
   1: SpineBase;
   2: KneeLeft;
   3: KneeRight;
   4: HandLeft;
   5: HandRight;
   6: HandTipLeft
   7: HandTipRight
   8: ThumbLeft
   9: ThumbRight
   */

  if (index == 0) {
    return KinectPV2.JointType_Head;
  } else if (index == 1) {
    return KinectPV2.JointType_SpineBase;
  } else if (index == 2) {
    return KinectPV2.JointType_KneeLeft;
  } else if (index == 3) {
    return KinectPV2.JointType_KneeRight;
  } else if (index == 4) {
    return KinectPV2.JointType_HandLeft;
  } else if (index == 5) {
    return KinectPV2.JointType_HandRight;
  } else if (index == 6) {
    return KinectPV2.JointType_HandTipLeft;
  } else if (index == 7) {
    return KinectPV2.JointType_HandTipRight;
  } else if (index == 8) {
    return KinectPV2.JointType_ThumbLeft;
  } else if (index == 9) {
    return KinectPV2.JointType_ThumbRight;
  } else {
    return 5;
  }
}