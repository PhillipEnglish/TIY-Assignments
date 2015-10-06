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



