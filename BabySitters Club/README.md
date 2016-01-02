





Data Import Steps:

FACEBOOK   X   FIREBASE   X    ALAMOFIRE

Final Detail Notes for Object Models, ViewController & TableViewCOntroller

0. Nested entire model creation unser AlamofireRef
1. Fixed Placement of Pepare For Sewgue
2. Made Array of Sitter Objects a Global Variable, which I appended at end of Alamofire Response
3. added AlamoRef.resume() -- not sure if I actually need this, but it works
4. Under ViewDidLoad() -->> inserted 'sitterModelObjects.removeAll()' above returnUserData()
5. Accessed Global Array of SitterObjects in TVC