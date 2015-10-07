class BodyPart
{
    var isAttached: Bool
    var isNotBecomingZombified: Bool
    var numberAttachedToBody: Int
    
    init(attached: Bool, notAZombie: Bool, numberAvailable: Int)
    {
        self.isAttached = attached
        self.isNotBecomingZombified = notAZombie
        self.numberAttachedToBody = numberAvailable
    }
    
    func generate ()
    {
        //every living thing has its birth
    }
    
    func age ()
    {
       // every living thing grows old
    }
    
    func decay()
    {
        // all things must pass
    }
}


//1
class Ears: BodyPart
{
    let earDrum = true
    let cochlea = true
    let earlobe = true
    
    init(earDrum: Bool, cochlea: Bool, earlobe: Bool)
    {
        self.earDrum = earDrum
        self.cochlea = cochlea
        self.earlobe = earlobe
    }
    
    func hearSounds()
    {
        
    }
    
    func ringWithTinnitus()
    {
        
    }
    
    func makeEarWax(){
        
    }
    
}


//2
class Nose: BodyPart
{
    let nostrils = 2
    let noseHairs = true
    let septum = true
    
    init(nostrils: Int, noseHairs: Bool, septum: Bool)  //Because I set nostrils to 2 and it's a given that most humans will have 2, I'm unsure if this needs to be included in the init, but am putting here for thoroughness. This applies to the initialization of Booleans in classes in this playground as well.
    {
        self.nostrils = nostrils
        self.noseHairs = noseHairs
        self.septum = septum
    }
    
    func sniffle ()
    {
        
    }
    
    func smell ()
    {
        // If your nose runs, and your feet smell, then you are built backwards
    }
    
    func sneeze ()
    {
        
    }
}


//3
class Mouth: BodyPart {
   let lips = true
    var teeth: Int
   let tongue = true

    init(lips: Bool, teeth: Int, tongue: Bool)
    {
        self.lips = lips
        self.teeth = teeth
        self.tongue = tongue
    }
    
    func taste ()
    {
        
    }
    
    func talk ()
    {
        
    }
    
    func chew ()
    {
        
    }
}


//4
class Head: BodyPart {
    var hair : Bool
    let scalp = true
    let skull = true
    
    init (hair: Bool, scalp: Bool, skull: Bool)
    {
        self.hair = hair
        self.scalp = scalp
        self.skull = skull
    }
    
    func headBang () {
        
    }
    
    func nod () {
        
    }
    
    func headBut () {
        
    }
}


//5
class Legs: BodyPart {
    let thigh = true
    let calf = true
    let shin = true
    
    init(thigh: Bool, calf: Bool, shin: Bool)
    {
        self.thigh = thigh
        self.calf = calf
        self.shin = shin
    }
    
    func run () {
        
    }
    
    func jump () {
        
    }
    
    func kick () {
        
    }
}


//6
class Eyes: BodyPart {
    var iris: String
    let pupil = true
    let cornea = true
    
    init(iris: String, pupil: Bool, cornea: Bool)
    {
        self.iris = iris
        self.pupil = pupil
        self.cornea = cornea
    }
    
    func see () {
        
    }
    
    func cry () {
        
    }
    
    func blink () {
        
    }
}


//7
class Hands: BodyPart {
    var fingers = 10
    var knuckles = 10
    var fingernails = 10
    
    init(fingers: Int, knuckles: Int, fingernails: Int)
    {
        self.fingers = fingers
        self.knuckles = knuckles
        self.fingernails = fingernails
    }
    
    func grasp () {
        
    }
    
    func wave () {
        
    }
    
    func shake () {
        
    }
}


//8
class Brain: BodyPart {
    var frontalLobe: Bool //variable booleans because lobotomies happen
    var cerebellum: Bool
    var occipitalLobe: Bool
    
    init(frontalLobe: Bool, cerebellum: Bool, occipitalLobe: Bool)
    {
        self.frontalLobe = frontalLobe
        self.cerebellum = cerebellum
        self.occipitalLobe = occipitalLobe
    }
    
    func makeDecisions () {
        
    }
    
    func feelFeelings () {
        
    }
    
    func ponderExistenceOfSelf () {
        //possibly a recursive function
    }
}


//9
class Neck: BodyPart {
    let throat = true
    let adamsApple: Bool
    let larynx: Bool
    
    init (throat: Bool, adamsApple: Bool, larynx: Bool) {
        self.throat = throat
        self.adamsApple = adamsApple
        self.larynx = larynx
    }
    
    func attachNeckToBody () {
        
    }
    
    func yogaNeckStretch () {
        
    }
    
    func supportTheSpine () {
        
    }
}


//10
class Torso: BodyPart {
    var ribs = true
    var abdomen = true
    let chest = true
    
    init (ribs: Bool, abdomen: Bool, chest: Bool)
    {
        self.ribs = ribs
        self.abdomen = abdomen
        self.chest = chest
    }
    
    func holdBodyTogether () {
        
    }
    
    func storeOrgans () {
        
    }
    
    func getRipped () {
        
    }
}


//11
class Knees: BodyPart{
    let femur: Bool
    let patella: Bool
    let tibia: Bool
    
    init (femur: Bool, patella: Bool, tibia: Bool) {
        self.femur = femur
        self.patella = patella
        self.tibia = tibia
    }
    
    func joinThightoShin (){
        
    }
    
    func bendWhileWalking () {
        
    }
    
    func stabilizeWhileStanding () {
        
    }
    
}


//12
class Kidney: BodyPart {
    let majorCalyx : String
    let medulla: String
    let renalArtery: String
    
    init (majorCalyx: String, medulla: String, renalArtery: String) {
        self.majorCalyx = majorCalyx
        self.medulla = medulla
        self.renalArtery = renalArtery
    }
    
    func extractWasteFromBlood () {
        
    }
    
    func forUrine () {
        
    }
    
    func balanceBodyFluids () {
        
    }
    
}


//13
class Back: BodyPart {
    let spine: String
    let upperBack: String
    let lowerBack: String
    
    init (spine: String, upperBack: String, lowerBack: String){
        self.spine = spine
        self.upperBack = upperBack
        self.lowerBack = lowerBack
    }
    
    func provideBalanceAndStability () {
        
    }
    
    func supportUpperBodyMovement () {
        
    }
    
    func protectVertebralColumn () {
        
    }
}


//14
class GallBladder: BodyPart {
    
    let cysticDuct: String
    let bileDuct: String
    let fundus: String
    
    init (cysticDuct: String, bileDuct: String, fundus: String){
        self.cysticDuct = cysticDuct
        self.bileDuct = bileDuct
        self.fundus = fundus
    }
    
    func storeBile () {
        
    }
    
    func concentrateBile () {
        
    }
    
    func supportLiver () {
        
    }
}


//15
class Hips: BodyPart {
    let illiacCrest: String
    let acetabulum: String
    let pelvis: String
    
    init (illiacCret: String, acetabulum: String, pelvis: String) {
        self.illiacCrest = illiacCret
        self.acetabulum = acetabulum
        self.pelvis = pelvis
    }
    
    func supportBodyWhileStanding () {
        
    }
    
    func shakeWhileDancing () {
        
    }
    
    func provideRangeOfMotion () {
        
    }
}


//16
class Stomach: BodyPart {
    let esophagus: String
    let fundus: String
    let body: String
    
    init (esophagus: String, fundus: String, body: String) {
        self.esophagus = esophagus
        self.fundus = fundus
        self.body = body
        }
    func receiveFood () {
        
    }
    
    func releaseEnzymes () {
        
    }
    
    func digestFood () {
        
    }
}


//17
class Feet: BodyPart {
    let toes: String
    let instep: String
    let heel: String
    
    init (toes: String, instep: String, heel: String) {
        self.toes = toes
        self.instep = instep
        self.heel = heel
    }
    
    func absorbShock () {
        
    }
    
    func raiseOnToes () {
        
    }
    
    func holdBodyWeight () {
        
    }
}


//18
class Heart: BodyPart {
    let mitralValve: String
    let rightAtria: String
    let aorta: String
    
    init (mitralValve: String, rightAtria: String, aorta: String) {
        self.mitralValve = mitralValve
        self.rightAtria = rightAtria
        self.aorta = aorta
    }
    
    func beat () {
        
    }
    
    func moveBlood () {
        
    }
    
    func race () {
        
    }
}


//19
class Intestines: BodyPart {
    let largeIntestine: String
    let jejunum: String
    let duodenum: String
    
    init (largeIntestin: String, jejunum: String, duodenum: String) {
    self.largeIntestine = largeIntestin
    self.jejunum = jejunum
    self.duodenum = duodenum
    }
    
    func digestFood () {
        
    }
    
    func clearWaste () {
        
    }
    
    func enableNutrients () {
        
    }
}


//20
class Liver: BodyPart {
    let rightLobe: String
    let leftLobe: String
    let gallBladder: String
    
    init (rightLobe: String, leftLobe: String, gallBladder: String) {
        self.rightLobe = rightLobe
        self.leftLobe = leftLobe
        self.gallBladder = gallBladder
    }
    
    func cleanBlood () {
        
    }
    
    func produceBile () {
        
    }
    
    func storeGlycogen () {
        
    }
    
}
