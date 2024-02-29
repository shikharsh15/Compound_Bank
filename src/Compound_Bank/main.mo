import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor icpBank{
  stable var currentValue:Float= 300;
  // currentValue:=500;
  // let id = 2721704784137814;
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));
  // Debug.print(debug_show(id));
  public func topUp(add:Float){
    currentValue+=add;
    Debug.print(debug_show(currentValue));
  };
  public func withdrawl(amt:Float){
    let tempValue :Float =currentValue-amt;
    if(tempValue>=0){
      currentValue-=amt;
      Debug.print(debug_show(currentValue));
    }else{
            Debug.print("You current value is less than withdrawl amt.");

      Debug.print(debug_show(currentValue));
    }
  };
  public query func checkBalance():async Float{
    Debug.print(debug_show(currentValue));
    return currentValue;
  };
  public func getInterest(){
    let currTime=Time.now();
    let secElapsed = (currTime-startTime)/1000000000;
    currentValue:=currentValue*(1+0.01)**(Float.fromInt(secElapsed));
    startTime:=currTime;
  };
}