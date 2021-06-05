local Gravity = {}

Gravity.x = 0
Gravity.y = 300

function Gravity.update(dt, objects, floors)
    for key,object in pairs(objects) do
        for key,floor in pairs(floors) do


            object.y = object.y + Gravity.y * dt
        end
    end
end

return Gravity



--[[
protected Point checkCollision(ArrayList<GameObject> gameObjects) {
    Point newSpeed = new Point(speed);
    for(int i = 0; i < gameObjects.size(); i++){
        GameObject object = gameObjects.get(i);
        
        if(object != this){
            //coming on from the left side
            if (this.getRight() <= object.getLocation().x && this.getRight() + speed.x > object.getLocation().x){
                if (this.loc.y < object.getBottom() && this.getBottom() > object.getLocation().y){
                    //hitting wall from left side
                    newSpeed = object.leftSideHit(this, newSpeed);
                } else if (this.getBottom() <= object.getLocation().y && this.getBottom() + speed.y > object.getBottom()){
                    //landing down from above and left
                    newSpeed = object.topSideHit(this, newSpeed);
                    this.onFloor = true;
                } else if (this.loc.y >= object.getBottom() && this.loc.y + speed.y < object.getBottom()){
                    //hit head on roof of platform from left
                    newSpeed = object.bottomSideHit(this, newSpeed);
                }
                
            //coming on from the right side
            } else if (this.loc.x >= object.getRight() && this.loc.x + speed.x < object.getRight()){
                if (this.loc.y < object.getBottom() && this.getBottom() > object.getLocation().y){
                    //hitting wall from right side
                    newSpeed = object.rightSideHit(this, newSpeed);
                } else if (this.getBottom() <= object.getLocation().y && this.getBottom() + speed.y > object.getLocation().y){
                    //landing down from above and right
                    newSpeed = object.topSideHit(this, newSpeed);
                    this.onFloor = true;
                } else if (this.loc.y >= object.getBottom() && this.loc.y + speed.y < object.getBottom()){
                    //hit head on roof of platform from right
                    newSpeed = object.bottomSideHit(this, newSpeed);
                }
            }
            
            if (newSpeed.y > 0){
                if (this.getBottom() <= object.getLocation().y && this.getBottom() + speed.y > object.getLocation().y){
                    if(this.getRight() + newSpeed.x > object.getLocation().x && this.loc.x + newSpeed.x < object.getRight()){
                        //land on platform
                        newSpeed = object.topSideHit(this, newSpeed);
                        this.onFloor = true;
                    }
                }
            } else {
                if (this.loc.y >= object.getBottom() && this.loc.y + speed.y < object.getBottom()){
                    if(this.getRight() + newSpeed.x > object.getLocation().x && this.loc.x + newSpeed.x < object.getRight()){
                        //hit head
                        newSpeed = object.bottomSideHit(this, newSpeed);
                    }
                }	
            }
        }	
    }
    return newSpeed;
}]]