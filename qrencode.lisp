;;; This file was automatically generated by SWIG (http://www.swig.org).
;;; Version 2.0.9
;;;
;;; Do not make changes to this file unless you know what you are doing--modify
;;; the SWIG interface file instead.


;;;SWIG wrapper code starts here

(cl:defmacro defanonenum (&body enums)
   "Converts anonymous enums to defconstants."
  `(cl:progn ,@(cl:loop for value in enums
                        for index = 0 then (cl:1+ index)
                        when (cl:listp value) do (cl:setf index (cl:second value)
                                                          value (cl:first value))
                        collect `(cl:defconstant ,value ,index))))

(cl:eval-when (:compile-toplevel :load-toplevel)
  (cl:unless (cl:fboundp 'swig-lispify)
    (cl:defun swig-lispify (name flag cl:&optional (package cl:*package*))
      (cl:labels ((helper (lst last rest cl:&aux (c (cl:car lst)))
                    (cl:cond
                      ((cl:null lst)
                       rest)
                      ((cl:upper-case-p c)
                       (helper (cl:cdr lst) 'upper
                               (cl:case last
                                 ((lower digit) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:lower-case-p c)
                       (helper (cl:cdr lst) 'lower (cl:cons (cl:char-upcase c) rest)))
                      ((cl:digit-char-p c)
                       (helper (cl:cdr lst) 'digit 
                               (cl:case last
                                 ((upper lower) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:char-equal c #\_)
                       (helper (cl:cdr lst) '_ (cl:cons #\- rest)))
                      (cl:t
                       (cl:error "Invalid character: ~A" c)))))
        (cl:let ((fix (cl:case flag
                        ((constant enumvalue) "+")
                        (variable "*")
                        (cl:t ""))))
          (cl:intern
           (cl:concatenate
            'cl:string
            fix
            (cl:nreverse (helper (cl:concatenate 'cl:list name) cl:nil cl:nil))
            fix)
           package))))))

;;;SWIG wrapper code ends here


(cffi:defcenum QRencodeMode
	(:QR_MODE_NUL #.-1)
	(:QR_MODE_NUM #.0)
	:QR_MODE_AN
	:QR_MODE_8
	:QR_MODE_KANJI
	:QR_MODE_STRUCTURE
	:QR_MODE_ECI
	:QR_MODE_FNC1FIRST
	:QR_MODE_FNC1SECOND)

(cffi:defcenum QRecLevel
	(:QR_ECLEVEL_L #.0)
	:QR_ECLEVEL_M
	:QR_ECLEVEL_Q
	:QR_ECLEVEL_H)

(cl:defconstant QRSPEC_VERSION_MAX 40)

(cl:defconstant MQRSPEC_VERSION_MAX 4)

(cffi:defcfun ("QRinput_new" QRinput_new) :pointer)

(cffi:defcfun ("QRinput_new2" QRinput_new2) :pointer
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRinput_newMQR" QRinput_newMQR) :pointer
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRinput_append" QRinput_append) :int
  (input :pointer)
  (mode QRencodeMode)
  (size :int)
  (data :pointer))

(cffi:defcfun ("QRinput_appendECIheader" QRinput_appendECIheader) :int
  (input :pointer)
  (ecinum :unsigned-int))

(cffi:defcfun ("QRinput_getVersion" QRinput_getVersion) :int
  (input :pointer))

(cffi:defcfun ("QRinput_setVersion" QRinput_setVersion) :int
  (input :pointer)
  (version :int))

(cffi:defcfun ("QRinput_getErrorCorrectionLevel" QRinput_getErrorCorrectionLevel) QRecLevel
  (input :pointer))

(cffi:defcfun ("QRinput_setErrorCorrectionLevel" QRinput_setErrorCorrectionLevel) :int
  (input :pointer)
  (level QRecLevel))

(cffi:defcfun ("QRinput_setVersionAndErrorCorrectionLevel" QRinput_setVersionAndErrorCorrectionLevel) :int
  (input :pointer)
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRinput_free" QRinput_free) :void
  (input :pointer))

(cffi:defcfun ("QRinput_check" QRinput_check) :int
  (mode QRencodeMode)
  (size :int)
  (data :pointer))

(cffi:defcfun ("QRinput_Struct_new" QRinput_Struct_new) :pointer)

(cffi:defcfun ("QRinput_Struct_setParity" QRinput_Struct_setParity) :void
  (s :pointer)
  (parity :unsigned-char))

(cffi:defcfun ("QRinput_Struct_appendInput" QRinput_Struct_appendInput) :int
  (s :pointer)
  (input :pointer))

(cffi:defcfun ("QRinput_Struct_free" QRinput_Struct_free) :void
  (s :pointer))

(cffi:defcfun ("QRinput_splitQRinputToStruct" QRinput_splitQRinputToStruct) :pointer
  (input :pointer))

(cffi:defcfun ("QRinput_Struct_insertStructuredAppendHeaders" QRinput_Struct_insertStructuredAppendHeaders) :int
  (s :pointer))

(cffi:defcfun ("QRinput_setFNC1First" QRinput_setFNC1First) :int
  (input :pointer))

(cffi:defcfun ("QRinput_setFNC1Second" QRinput_setFNC1Second) :int
  (input :pointer)
  (appid :unsigned-char))

(cffi:defcstruct QRcode
	(version :int)
	(width :int)
	(data :pointer))

(cffi:defcstruct QRcode_List
	(code :pointer)
	(next :pointer))

(cffi:defcfun ("QRcode_encodeInput" QRcode_encodeInput) :pointer
  (input :pointer))

(cffi:defcfun ("QRcode_encodeString" QRcode_encodeString) :pointer
  (string :string)
  (version :int)
  (level QRecLevel)
  (hint QRencodeMode)
  (casesensitive :int))

(cffi:defcfun ("QRcode_encodeString8bit" QRcode_encodeString8bit) :pointer
  (string :string)
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRcode_encodeStringMQR" QRcode_encodeStringMQR) :pointer
  (string :string)
  (version :int)
  (level QRecLevel)
  (hint QRencodeMode)
  (casesensitive :int))

(cffi:defcfun ("QRcode_encodeString8bitMQR" QRcode_encodeString8bitMQR) :pointer
  (string :string)
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRcode_encodeData" QRcode_encodeData) :pointer
  (size :int)
  (data :pointer)
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRcode_encodeDataMQR" QRcode_encodeDataMQR) :pointer
  (size :int)
  (data :pointer)
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRcode_free" QRcode_free) :void
  (qrcode :pointer))

(cffi:defcfun ("QRcode_encodeInputStructured" QRcode_encodeInputStructured) :pointer
  (s :pointer))

(cffi:defcfun ("QRcode_encodeStringStructured" QRcode_encodeStringStructured) :pointer
  (string :string)
  (version :int)
  (level QRecLevel)
  (hint QRencodeMode)
  (casesensitive :int))

(cffi:defcfun ("QRcode_encodeString8bitStructured" QRcode_encodeString8bitStructured) :pointer
  (string :string)
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRcode_encodeDataStructured" QRcode_encodeDataStructured) :pointer
  (size :int)
  (data :pointer)
  (version :int)
  (level QRecLevel))

(cffi:defcfun ("QRcode_List_size" QRcode_List_size) :int
  (qrlist :pointer))

(cffi:defcfun ("QRcode_List_free" QRcode_List_free) :void
  (qrlist :pointer))

(cffi:defcfun ("QRcode_APIVersion" QRcode_APIVersion) :void
  (major_version :pointer)
  (minor_version :pointer)
  (micro_version :pointer))

(cffi:defcfun ("QRcode_APIVersionString" QRcode_APIVersionString) :string)

(cffi:defcfun ("QRcode_clearCache" QRcode_clearCache) :void)


