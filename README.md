____________________
SitterBook - iOS App
--------------------
INITIAL FEATURE IMPLEMENTATION:

App Setup

0. Device Setup => Setup Test Device
							( provisioning profile )
Data Summary-

1. Facebook Client Login
=> [ FacebookID , Facebook Name ]

2. Addititonal Data Collection
=> [ ZIP , //DAYS/TIMES.. not part of MVP ]

3. Auth (FireBase)
=> [ Password , OAuth ID , EMAIL ]
- - - - - - - - - - -

4. Send to FIREBASE => 	

	a) Create User OAuth on FireBase [ name, email, FrireBaseID ]

	b) Create User Data Object [ FacebookID , Facebook Name , ZIP ]


- - - - - - - - - - - 
UI/UX:
______________________

5. Basic User Onboarding

		a)Edit Zip Code in App
		b)Facebook SignUp

6. Slide Menu (Solution.)

//====================================================\\
IMPORTANT
Data Import Steps:

FACEBOOK   X   FIREBASE   X    ALAMOFIRE

Final Detail Notes for Object Models, ViewController & TableViewCOntroller

0. Nested entire model creation unser AlamofireRef
1. Fixed Placement of Pepare For Sewgue
2. Made Array of Sitter Objects a Global Variable, which I appended at end of Alamofire Response
3. added AlamoRef.resume() -- not sure if I actually need this, but it works
4. Under ViewDidLoad() -->> inserted 'sitterModelObjects.removeAll()' above returnUserData()
5. Accessed Global Array of SitterObjects in TVC

---------------------------------------------------
Resources:
-----------

A) FireBase Chat App Tutorial

B) Best Practice for iOS UIViewCtrlr & Firebase

C) Udemy- 4 Courses -- https://www.udemy.com/home/my-courses/learning/?ref=udropdown

