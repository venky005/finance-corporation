import java.util.*;

class Sample  {

        public static void main(String[] args) {

          Date dt=new Date();

          String ret=dt.toString();

          StringTokenizer st=new StringTokenizer(ret," ");

          Vector ele=new Vector();

          while(st.hasMoreTokens()) 

                        ele.addElement(st.nextToken());
                     
                        System.out.println("Original Date:\t"+dt+"\n\n");

                        for(int e=0;e<ele.size();e++)

                        System.out.println(ele.elementAt(e));
     
                        System.out.println("\n\n");

                        System.out.println("Extracting Date:"+ele.elementAt(2)+"-"+ele.elementAt(1)+"-"+ele.elementAt(ele.size()-1));

                        }

 }
