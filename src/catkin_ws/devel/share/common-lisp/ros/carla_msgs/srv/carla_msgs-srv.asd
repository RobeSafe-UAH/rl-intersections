
(cl:in-package :asdf)

(defsystem "carla_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :diagnostic_msgs-msg
               :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "DestroyObject" :depends-on ("_package_DestroyObject"))
    (:file "_package_DestroyObject" :depends-on ("_package"))
    (:file "GetBlueprints" :depends-on ("_package_GetBlueprints"))
    (:file "_package_GetBlueprints" :depends-on ("_package"))
    (:file "SpawnObject" :depends-on ("_package_SpawnObject"))
    (:file "_package_SpawnObject" :depends-on ("_package"))
  ))