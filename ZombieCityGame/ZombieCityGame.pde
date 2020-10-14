int MAX_ZOMBIES = 50;
int MAX_CHARACTERS = 50;


character[] characters = new character[MAX_CHARACTERS];

float playerX = 250;
float playerY = 250;

boolean _up, _down, _left, _right; 

ArrayList<Bullet> bullets;

float gunCD=.25;
float lastFired=0;
void setup()
{
  bullets = new ArrayList<Bullet>();
  size(800,600);
  for(int i =0; i < MAX_CHARACTERS; i++)
  {
    characters[i] = new character();
    if(characters[i].isInfected())
    {
      if(i-1>=0)
      {
        characters[i].target(characters[i-1]);
      }
    }
  }
  
  
}

void draw()
{
  background(0);
  noStroke();
  fill(255,0,255);
  ellipse(playerX, playerY, 4,4);
  
  
  for(int i =0; i < MAX_CHARACTERS; i++)
  {
    characters[i].update();
    characters[i].render();
    
    for(int j =0; j < MAX_CHARACTERS; j++)
    {
      if(i != j)
      {
        characters[i].isTouching(characters[j]);
      }
    }
    
  }
  fill(255,0,0);
  textSize(32);
  text(lastFired, 10, 30);
  if(mousePressed)
  {
    if(millis() - lastFired > gunCD*1000)
    {
      lastFired = millis();
      bullets.add(new Bullet(new PVector(playerX, playerY)));
    }
    
  }
  
  if(!bullets.isEmpty())
  {
    for(Bullet b : bullets)
    {
      b.Update();
      
    }

  }
  
  for (int i = bullets.size()-1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    if (b.isOutOfBounds()) {
      bullets.remove(i);
    }
  }
  
   if(keyPressed){
    println(keyCode);
    if (key == 'w'){ _up = true; }
    if (key == 's'){_down = true; }
    if (keyCode == LEFT){_left = true;}
    if (keyCode == RIGHT){_right = true;}
  }
  
  
    if(_up)
    {
      playerY-=2;
    }
    
    if(_left)
    {
      playerX-=2;
    }
    
    if(_down)
    {
      playerY+=2;
    }
    
    if(_right)
    {
      playerX+=2;
    }
  
  
}

void keyReleased()
{
  if (keyCode == UP)
  {
    _up = false;
  }
  if (keyCode == DOWN)
  {
   _down = false;
  }
  if (keyCode == LEFT)
  {
    _left = false;
  }
    if (keyCode == RIGHT)
  {
    _right = false;
  }
}

void keyPressed()
{
  
}