class Bullet
{
  PVector _location;
  PVector _velocity;
  PVector _acceleration;
  float _topSpeed;
  PVector _target;
  
  Bullet()
  {
    _location = new PVector(width/2, height/2);
    _velocity = new PVector(0,0);
    _topSpeed = 30;
    _target = new PVector(mouseX, mouseY);
  }
  Bullet(PVector pLoc)
  {
    
    _velocity = new PVector(0,0);
    _topSpeed = 10;
    _target = new PVector(mouseX, mouseY);
    _location = new PVector(pLoc.x, pLoc.y);
    
    PVector dir = PVector.sub(_target,_location);
    dir.normalize();
    dir.mult(2);
    _acceleration = dir;
  }
  
  void Draw()
  {
    fill(255,255,0);
    ellipse(_location.x, _location.y, 3, 3);
  }
  
  
  boolean isOutOfBounds()
  {
    if(_location.x>width || _location.x<0)
     {
       return true;
     }
     if(_location.y>height || _location.y<0)
     {
       return true;
     }
     
     return false;
  }
  void Move()
  {
   
    _velocity.add(_acceleration);
    _velocity.limit(_topSpeed);
    _location.add(_velocity);
  }
  void Update()
  {
    Move();
    Draw();
  }
  
}