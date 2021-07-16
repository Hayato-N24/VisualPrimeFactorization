String input = "";
int value;
int tm = 0;
int x1 = 300;
int x2 = 300;


boolean isPrime(int n){
  int divisor = 1;
  int divisor_num = 0;
  
  while (divisor <= n){
    if (n % divisor == 0){
      divisor_num += 1;
    }
    divisor += 1;
  }
  if (divisor_num == 2){
    return true;
  }
  else{
    return false;
  }  
}

int[] factorization(int n){
  int[] result = {};
  int pn = 2;
  int value = n;
  int i = 0;
  
  while (value > 1){
    while (value % pn == 0){
      result = append(result,pn);
      value /= pn;     
    }
    i = pn+1;
    
    while (isPrime(i) == false){
      i += 1;
    }
    pn = i;
  }
  return result;
}

void ellipsetakusan(){
  for(int i=1; i<100;i++){
    fill(random(1,255),random(1,255),random(1,255),random(1,100));
    ellipse(random(50,550),random(50,550),random(100,200),random(100,200));
  }
}

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  background(0);   
  textAlign(CENTER);
  PFont font = createFont("HiraMaruProN-W4",30);
  textFont(font);
  ellipsetakusan();
  fill(255);
  text("素因数分解したい数字を入力してください",300,300);
  text("入力が終わったらエンターを押してね",300,350);
  text("7桁くらいまでは調子良く動くよ",300,400);
}

void draw() {
  if(keyPressed && key == ENTER){       
     tm = millis();
  }
  if(tm > 1){
    background(0);
    fill(0,102,51);  
    rect(0,0,600,300);
    
    fill(255);   
    text("アルゴリズムの呼吸！！",x1,290);   
    text("壱の型 素因数分解！！",x2,330);
    x1 = x1+2;
    x2 = x2-2;
     
    if((millis()-tm) >= 3000){
      background(0); 
      ellipsetakusan();
      int[] pnums = factorization(value);
      for(int i=0; i<pnums.length; i++){
        fill(255);
        text(int(pnums[i]),random(50,500),random(50,500));
        noLoop();
      }
    }
   }
}
 
 
void keyPressed(){
   if(Character.isDigit(key)){
      background(0);  
      ellipsetakusan();     
      input += key;
      value = Integer.parseInt(input);
      fill(255);
      text(value,300,300);
   }
 }
