SpaceShip falcon;
Star [] destroyers;
//finish keyPressed
//hyperspace
//and star class
public void setup() 
{
  size(700,600);
  smooth();
  falcon = new SpaceShip();
  destroyers = new Star[201];
  for(int i=0; i<destroyers.length; i++)
  {
    destroyers[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  for(int i=0; i<destroyers.length; i++)
  {
    destroyers[i].show();
  }
  falcon.move();
  
  falcon.show();
}
class SpaceShip extends Floater
{   
  SpaceShip()
  {
    corners = 22;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;
    yCorners[0] = -12;
    xCorners[1] = -4;
    yCorners[1] = -12;
    xCorners[2] = -8;
    yCorners[2] = -10;
    xCorners[3] = -10;
    yCorners[3] = -8;
    xCorners[4] = -13;
    yCorners[4] = -2;
    xCorners[5] = -13;
    yCorners[5] = 2;
    xCorners[6] = -10;
    yCorners[6] = 8;
    xCorners[7] = -8;
    yCorners[7] = 10;
    xCorners[8] = -4;
    yCorners[8] = 12;
    xCorners[9] = 0;
    yCorners[9] = 12;
    xCorners[10] = 2;
    yCorners[10] = 14;
    xCorners[11] = 5;
    yCorners[11] = 14;
    xCorners[12] = 7;
    yCorners[12] = 13;
    xCorners[13] = 7;
    yCorners[13] = 11;
    xCorners[14] = 5;
    yCorners[14] = 10;
    xCorners[15] = 4;
    yCorners[15] = 10;
    xCorners[16] = 14;
    yCorners[16] = 5;
    xCorners[17] = 14;
    yCorners[17] = 2;
    xCorners[18] = 4;
    yCorners[18] = 2;
    xCorners[19] = 4;
    yCorners[19] = -2;
    xCorners[20] = 14;
    yCorners[20] = -2;
    xCorners[21] = 14;
    yCorners[21] = -5;
    myColor = color(0,0,255);
    myCenterX = 350;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void setX(int x){myCenterX = x;} 
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;} 
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;} 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  } 
} 
class Star
{
  private int starX, starY;
  Star()
  {
    starX = ((int)(Math.random()*701));
    starY = ((int)(Math.random()*601));
  }
  public void show()
  {
    noStroke();
    fill(255);
    ellipse(starX,starY,5,5);
  }
}
public void keyPressed()
{
  if(key == 'a')
  {
    falcon.rotate(-30);
  }
  if(key == 'd')
  {
    falcon.rotate(30);
  }
  if(key == 'w') //accelerates up
  {
    falcon.accelerate(.15);
  }
  if(key == 's') //accelerate down
  {
    falcon.accelerate(-.15);
  }
}  
