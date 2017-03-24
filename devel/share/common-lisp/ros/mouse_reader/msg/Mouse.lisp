; Auto-generated. Do not edit!


(cl:in-package mouse_reader-msg)


;//! \htmlinclude Mouse.msg.html

(cl:defclass <Mouse> (roslisp-msg-protocol:ros-message)
  ((x_movement
    :reader x_movement
    :initarg :x_movement
    :type cl:fixnum
    :initform 0)
   (y_movement
    :reader y_movement
    :initarg :y_movement
    :type cl:fixnum
    :initform 0)
   (key_name
    :reader key_name
    :initarg :key_name
    :type cl:string
    :initform "")
   (key_pressed
    :reader key_pressed
    :initarg :key_pressed
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Mouse (<Mouse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mouse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mouse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mouse_reader-msg:<Mouse> is deprecated: use mouse_reader-msg:Mouse instead.")))

(cl:ensure-generic-function 'x_movement-val :lambda-list '(m))
(cl:defmethod x_movement-val ((m <Mouse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mouse_reader-msg:x_movement-val is deprecated.  Use mouse_reader-msg:x_movement instead.")
  (x_movement m))

(cl:ensure-generic-function 'y_movement-val :lambda-list '(m))
(cl:defmethod y_movement-val ((m <Mouse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mouse_reader-msg:y_movement-val is deprecated.  Use mouse_reader-msg:y_movement instead.")
  (y_movement m))

(cl:ensure-generic-function 'key_name-val :lambda-list '(m))
(cl:defmethod key_name-val ((m <Mouse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mouse_reader-msg:key_name-val is deprecated.  Use mouse_reader-msg:key_name instead.")
  (key_name m))

(cl:ensure-generic-function 'key_pressed-val :lambda-list '(m))
(cl:defmethod key_pressed-val ((m <Mouse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mouse_reader-msg:key_pressed-val is deprecated.  Use mouse_reader-msg:key_pressed instead.")
  (key_pressed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mouse>) ostream)
  "Serializes a message object of type '<Mouse>"
  (cl:let* ((signed (cl:slot-value msg 'x_movement)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_movement)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'key_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'key_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'key_pressed) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mouse>) istream)
  "Deserializes a message object of type '<Mouse>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_movement) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_movement) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'key_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'key_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'key_pressed) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mouse>)))
  "Returns string type for a message object of type '<Mouse>"
  "mouse_reader/Mouse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mouse)))
  "Returns string type for a message object of type 'Mouse"
  "mouse_reader/Mouse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mouse>)))
  "Returns md5sum for a message object of type '<Mouse>"
  "8d3171768b3aa775674c4585e9dc2c0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mouse)))
  "Returns md5sum for a message object of type 'Mouse"
  "8d3171768b3aa775674c4585e9dc2c0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mouse>)))
  "Returns full string definition for message of type '<Mouse>"
  (cl:format cl:nil "# Key code as defined in linux/inupt.h~%int16 x_movement~%int16 y_movement~%~%# Key name string as defined in evtest, see http://elinux.org/images/9/93/Evtest.c~%string key_name~%~%# 'True' if key was pressed, 'False' otherwise~%bool key_pressed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mouse)))
  "Returns full string definition for message of type 'Mouse"
  (cl:format cl:nil "# Key code as defined in linux/inupt.h~%int16 x_movement~%int16 y_movement~%~%# Key name string as defined in evtest, see http://elinux.org/images/9/93/Evtest.c~%string key_name~%~%# 'True' if key was pressed, 'False' otherwise~%bool key_pressed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mouse>))
  (cl:+ 0
     2
     2
     4 (cl:length (cl:slot-value msg 'key_name))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mouse>))
  "Converts a ROS message object to a list"
  (cl:list 'Mouse
    (cl:cons ':x_movement (x_movement msg))
    (cl:cons ':y_movement (y_movement msg))
    (cl:cons ':key_name (key_name msg))
    (cl:cons ':key_pressed (key_pressed msg))
))
