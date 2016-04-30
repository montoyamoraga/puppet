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

import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

KJoint[] joints;
int trailingJointIndex;

ArrayList<KSkeleton> skeletonArray = new ArrayList<KSkeleton>();
ArrayList<PVector> trailingJointPositions = new ArrayList<PVector>();

//we need 11 of all the kinect joints
int jointsNum = 11;
int kinectScaling = 500;

void setupKinect() {
  kinect = new KinectPV2(this);
  kinect.enableSkeleton3DMap(true);
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
}s