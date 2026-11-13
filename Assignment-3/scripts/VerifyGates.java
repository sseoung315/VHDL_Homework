import com.cburch.logisim.file.*;
import com.cburch.logisim.proj.*;
import com.cburch.logisim.circuit.*;
import com.cburch.logisim.comp.*;
import com.cburch.logisim.data.*;
import com.cburch.logisim.std.wiring.Pin;
import com.cburch.logisim.instance.StdAttr;
import java.nio.file.*;
import java.io.*;
import java.util.*;
public class VerifyGates {
 public static void main(String[] args)throws Exception{
  com.cburch.logisim.Main.headless=true;
  var f=new Loader(null).openLogisimFile(new File(args[0]));var project=new Project(f);
  var circuits=new ArrayList<Circuit>(f.getCircuits());
  Map<Integer,CircuitState> states=new HashMap<>();int failures=0;
  var out=new PrintWriter(args[2]+"/logisim_results.csv");
  out.println("circuit,case,inputs,expected_q,expected_qb,observed_q,observed_qb,result");
  for(String line:Files.readAllLines(Path.of(args[1]))){
   String[] a=line.split("\t");int ix=Integer.parseInt(a[0]);var c=circuits.get(ix-1);
   var state=states.computeIfAbsent(ix,k->project.getCircuitState(c));
   Map<String,com.cburch.logisim.comp.Component> pins=new HashMap<>();
   for(var comp:c.getNonWires())if(comp.getFactory() instanceof Pin)pins.put(comp.getAttributeSet().getValue(StdAttr.LABEL),comp);
   for(String entry:a[3].split(",")){String[] kv=entry.split("=");var comp=pins.get(kv[0]);Pin.FACTORY.setValue(state.getInstanceState(comp),kv[1].equals("1")?Value.TRUE:Value.FALSE);state.markComponentAsDirty(comp);}
   state.getPropagator().propagate();
   String q=state.getValue(pins.get("Q").getLocation()).toDisplayString();String qb=state.getValue(pins.get("QB").getLocation()).toDisplayString();
   boolean pass=a[4].equals("-")||(q.equals(a[4])&&qb.equals(a[5]));
   String result=a[4].equals("-")?"SETUP":(pass?"PASS":"FAIL");
   out.println(a[1]+","+a[2]+",\""+a[3]+"\","+a[4]+","+a[5]+","+q+","+qb+","+result);
   System.out.println(a[1]+" "+a[2]+" Q="+q+" QB="+qb+" "+result);
   if(!pass)failures++;
  }
  for(int ix:states.keySet()){
   var circuit=circuits.get(ix-1);var state=states.get(ix);
   var scratch=new java.awt.image.BufferedImage(1,1,1).createGraphics();var b=circuit.getBounds(scratch).expand(20);
   var image=new java.awt.image.BufferedImage(b.getWidth()*2,b.getHeight()*2,1);var g=image.createGraphics();g.setColor(java.awt.Color.WHITE);g.fillRect(0,0,image.getWidth(),image.getHeight());g.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING,java.awt.RenderingHints.VALUE_ANTIALIAS_ON);g.scale(2,2);g.translate(-b.getX(),-b.getY());circuit.draw(new ComponentDrawContext(null,circuit,state,g,g,false),null);g.dispose();javax.imageio.ImageIO.write(image,"PNG",new File(args[2]+"/circuit-"+ix+".png"));
  }
  out.close();System.out.println("FAILURES="+failures);System.exit(failures==0?0:1);
 }
}
