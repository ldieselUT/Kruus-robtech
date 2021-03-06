// Copyright (c) 2015-2016, The University of Texas at Austin
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
// 
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
// 
//     * Neither the name of the copyright holder nor the names of its
//       contributors may be used to endorse or promote products derived from
//       this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/** @file keyboard_event_publisher.cpp
 * 
 *  'rosrun keyboard_reader keyboard_event_publisher'
 *  
 *  OR
 * 
 *  'rosrun keyboard_reader keyboard_event_publisher _path:=[user_specified_keyboard_path]'
 * 
 *  @author karl.kruusamae(at)utexas.edu
 */

#include "ros/ros.h"
#include "mouse_reader/mouse_reader.h"
#include "mouse_reader/Mouse.h"

/** Main function and a ROS publisher */
int main(int argc, char *argv[]) {
  
  // ROS init
  ros::init(argc, argv, "keyboard_event_publisher");
  // Use async spinner
  ros::AsyncSpinner spinner(1);
  spinner.start();

  // ROS node handle
  ros::NodeHandle nh;
  // Private node handle for optional ROS parameter _path
  ros::NodeHandle pnh("~");



  // Creates publisher that advertises Key messages on rostopic /keyboard
  ros::Publisher pub_mouse = nh.advertise<mouse_reader::Mouse>("mouse", 100);
  
  // Message for publishing key press events
  mouse_reader::Mouse mouse_event;

  // Vector containing event data
#define MOUSEFILE "/dev/input/event14"
struct input_event ie;
int fd;
    if((fd = open(MOUSEFILE, O_RDONLY)) == -1) {
    perror("opening device");
    exit(EXIT_FAILURE);
  }

  while(ros::ok())
  {
    read(fd, &ie, sizeof(struct input_event));
    if (ie.type == 2) {
	mouse_event.key_name = "moved mouse";      
	if (ie.code == 0) {
		mouse_event.x_movement = ie.value;
		mouse_event.y_movement = 0;
	}
      	else if (ie.code == 1) { 
		mouse_event.y_movement = ie.value;
		mouse_event.x_movement = 0; 
	}
    } else if (ie.type == 1) {
     	if (ie.code == 272 ) { 
		mouse_event.key_name = "Button event";
		mouse_event.key_pressed = ie.value;
		mouse_event.y_movement = 0;
		mouse_event.x_movement = 0; 
	}
			// publish a Key msg only if event code is greater than zero     
	} 			// true when key is pressed, false otherwise
    if(ie.type)
	pub_mouse.publish(mouse_event);
    
  } // end while
  
  // Close keyboard event file

  return 0;
} //end main
