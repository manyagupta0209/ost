# **SEQUENCE DETECTOR USING MOORE FSM**


## **OBJECTIVE**
To write programs and test benches for making a sequence generator using a Moore Finite State Machine (FSM)  using behavioral level modelling.




## **THEORY**


A Finite State Machine (FSM) is a computational model used to design systems that can be in one of a finite number of states at any time. It changes states based on inputs and predefined rules (transitions). FSMs are widely used in digital circuits, control systems, and software logic to represent sequential behavior.


There are mainly two types of Finite State Machines:


 1. **Moore Machine** – The output depends only on the current state.


2. **Mealy Machine** – The output depends on both the current state and the input.
Both represent sequential logic but differ in when and how the output changes.


**State Diagram** : A state diagram is a graphical representation of a finite state machine. It shows all possible states of a system, the transitions between them, and the inputs or conditions that trigger those transitions. Circles represent states, and arrows indicate how the system moves from one state to another based on inputs.


**State Table** : A state table is a tabular form that describes how a finite state machine behaves. It shows how the current state and input determine the next state and the output.


We can design a sequence generator in two ways :-
1. **Overlapping** : It allows reuse of bits between sequences.
2. **Non-overlapping** : The sequence must start fresh, with no bit reuse.


**For this experiment we are going to design a sequence detector to find out the sequence ‘101’, without overlapping.**


## **STATE DIAGRAM**
<img width="300" height="300" alt="image" src="https://github.com/user-attachments/assets/44a928d7-519d-4336-b772-29a8ff512229" />






## **FSM State Table (Moore Machine: Sequence ‘101’ Detector)**


<table>
  <tr>
    <th>Current State</th>
    <th colspan="2">Input</th>
    <th colspan="2">Next State & Output</th>
  </tr>
  <tr>
    <td></td>
    <th>0</th>
    <th>1</th>
    <th>0</th>
    <th>1</th>
  </tr>
  <tr>
    <td>S0 (0)</td>
    <td>S0 / 0</td>
    <td>S1 / 0</td>
    <td>S0 / 0</td>
    <td>S1 / 0</td>
  </tr>
  <tr>
    <td>S1 (0)</td>
    <td>S2 / 0</td>
    <td>S1 / 0</td>
    <td>S2 / 0</td>
    <td>S1 / 0</td>
  </tr>
  <tr>
    <td>S2 (0)</td>
    <td>S0 / 0</td>
    <td>S3 / 0</td>
    <td>S0 / 0</td>
    <td>S3 / 0</td>
  </tr>
  <tr>
    <td>S3 (1)</td>
    <td>S0 / 0</td>
    <td>S1 / 0</td>
    <td>S0 / 0</td>
    <td>S1 / 0</td>
  </tr>
</table>










## **CODE ON VIVADO**


- **Design Code:**


```verilog
module fsm_101_moore(x,clk,rst,y);
input clk, rst,x; output reg y;
reg q1, q0;
reg d1, d0;
always@(posedge clk)
begin
if(rst)
begin
q1<=1'b0; q0<=1'b0;
end
else
begin
q1<=d1; q0<=d0;
end
end
always@(*)
begin
d1 = ((~q1)&q0&(~x))|(q1)&(~q0)&(x);
d0=x;
y=q1&(~q0);
end
endmodule
```
- **Test Bench**
```verilog
module tb_moore;
reg clk, rst, x;
wire y;
fsm_101_moore uut(.clk(clk),.rst(rst),.x(x),.y(y));
always #4 clk = ~clk;
initial
begin
clk=0; rst=1;
#50 rst=0;
#3 x=0;
#3 x=1;
#3 x=1;
#3 x=1;
#3 x=0;
#3 x=1;
#3 x=1;
#3 x=1;
#3 x=1;
#3 x=0;
#3 x=1;


#5 $finish;
end
endmodule
```
## **OUTPUT**


<img width="1060" height="252" alt="image" src="https://github.com/user-attachments/assets/d1f2779b-772f-43e9-bb01-e1bbe6029b73" />
