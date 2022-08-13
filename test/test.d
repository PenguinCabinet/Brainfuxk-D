module test.test;
import std.stdio,std.process;

void one_test(string v){
    writeln(v);
    writeln(executeShell(v).output);
}

void main(){
    one_test(`brainfuxk-d "nothing"`);
    one_test(`brainfuxk-d "test/Correct Cases/Hello World.bf"`);
    one_test(`brainfuxk-d "test/Correct Cases/FizzBuzz.bf"`);
    one_test(`brainfuxk-d "test/Incorrect Cases/Illegal_Char.bf"`);
    one_test(`brainfuxk-d "test/Incorrect Cases/Incorrect_Block_Nest1.bf"`);
    one_test(`brainfuxk-d "test/Incorrect Cases/Incorrect_Block_Nest2.bf"`);
}