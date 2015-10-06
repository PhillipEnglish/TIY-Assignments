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
    
}


class Ears: BodyPart
{
    let earDrum = true
    let cochlea = true
    let earlobe = true

    func hearSounds()
    {
    
    }
    
    func ringWithTinnitus()
    {
    
    }

    func acheWithInfection(){
        
    }
}

class Nose: BodyPart
{
    
}

class Mouth: BodyPart {
    <#properties and methods#>
}

class Head: BodyPart {
    <#properties and methods#>
}

class Legs: BodyPart {
    
}

class Eyes: BodyPart {
    <#properties and methods#>
}

class Hands: BodyPart {
    <#properties and methods#>
}

class Brain: BodyPart {
    <#properties and methods#>
}

class Neck: BodyPart {
    <#properties and methods#>
}

class Torso: BodyPart {
    
}

class Knees: BodyPart{
    
}

class Navel: BodyPart {
    
}

class Back: BodyPart {
    
}

class Abdomen: BodyPart {
    
}

class Hips: BodyPart {
    
}

class Stomach: BodyPart {
    
}

class Chin: BodyPart {
    
}

class Heart: BodyPart {
    
}

class Intestines: BodyPart {
    
}

class Liver: BodyPart {
    
}
