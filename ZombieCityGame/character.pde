class character
{
  PVector pos;
  PVector velocity;

  int health;
  boolean isInfected;
  character prey;
 
  PVector _velocity;
  PVector _acceleration;
  float _topSpeed;
  
  
  character()
  {
    pos = new PVector(random(300,800), random(200,600));
    velocity = new PVector(random(-1,1),random(-1,1));
    health = 100;
    
    if((int)random(0,10) >7 )
    {
      isInfected = true;
      _topSpeed = .5;
    }
    else
    {
      isInfected = false;
      _topSpeed = 2;
    }
  }
  boolean isInfected()
  {
    return isInfected;
  }
  void target(character _c)
  {
    prey=_c;
  }
  void update()
  {
    if(isInfected)
    {
      hunt();
    }
    else
    {
      wander();
    }
   
   
     // Check for bouncing
  if ((pos.x > width) || (pos.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((pos.y > height) || (pos.y < 0)) {
    velocity.y = velocity.y * -1;
  }

}
  
  
  void render()
  {
    if(isInfected)
    {
      fill(0,255,0);
      
    }
    else
    {
      fill(0,0,255);
    }
    ellipse(pos.x, pos.y, 3, 3);
  }
  
  
  void hunt()
  {
    if(prey != null)
    {
    
    
    PVector dir = PVector.sub(prey.pos,pos);
    dir.normalize();
    dir.mult(2);
    _acceleration = dir;
    
    velocity.add(_acceleration);
    velocity.limit(_topSpeed);
    pos.add(velocity);
    stroke(255,0,0);
    line(pos.x,pos.y,prey.pos.x,prey.pos.y);
    stroke(0);
    }
  }
  
  void wander()
  {
    velocity.limit(_topSpeed);
    pos.add(velocity);
  }
  
  void isTouching(character o)
  {
    if(dist(pos.x,pos.y,o.pos.x,o.pos.y) < 3)
    {
      if(o.isInfected ==true)
        isInfected = true;
    }
  }
}