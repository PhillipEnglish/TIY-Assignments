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
    
    init(nostrils: Int, noseHairs: Bool, septum: Bool)  //Because I set nostrils to 2 and it's a given that most humans will have 2, I'm unsure if this needs to be included in the init, but am putting here for thoroughness
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
}


//5
class Legs: BodyPart {
    
}


//6
class Eyes: BodyPart {
    <#properties and methods#>
}


//7
class Hands: BodyPart {
    <#properties and methods#>
}


//8
class Brain: BodyPart {
    <#properties and methods#>
}


//9
class Neck: BodyPart {
    <#properties and methods#>
}


//10
class Torso: BodyPart {
    
}


//11
class Knees: BodyPart{
    
}


//12
class Navel: BodyPart {
    
}


//13
class Back: BodyPart {
    
}


//14
class Abdomen: BodyPart {
    
}


//15
class Hips: BodyPart {
    
}


//16
class Stomach: BodyPart {
    
}


//17
class Chin: BodyPart {
    
}


//18
class Heart: BodyPart {
    
}


//19
class Intestines: BodyPart {
    
}


//20
class Liver: BodyPart {
    
}
