import std.stdio,
    std.file,
    std.string,
    core.stdc.stdio,
    std.conv;
import core.stdc.stdlib : exit;

string program_check(string program){
    char[] A=new char[program.length];
    uint A_index=0;
    int nest=0;
    foreach (e; program)
    {
        if(e=='<'||
            e=='>'||
            e=='+'||
            e=='-'||
            e=='.'||
            e==','||
            e=='['||
            e==']'
        ){
            if(e=='[')
                nest++;
            if(e==']')
                nest--;

            A[A_index]=e;
            A_index++;
        }else if(e=='\n'||
            e=='\r'||
            e=='\t'||
            e==' '
        ){
            continue;
        }else{
            writefln("ERROR:There is an illegal character in the source code.");
            exit(-1);
        }
        if(nest<0){
            writefln("ERROR:Incorrect block nesting.");
            exit(-1);
        }
    }
    
    if(nest!=0){
        writefln("ERROR:Incorrect block nesting.");
        exit(-1);
    }
    A[A_index]='\0';

    return A[0 .. A_index].idup;
}

void interpreter_main(string[] args){
    if(args.length<2){
        writefln("Please give the input Brainfuxk file.");
        exit(-1);
    }
	string program;
	try{
		program=readText(args[1]);
	}catch(std.file.FileException e){
		writeln("The input Brainfuxk file does not exist.");
		exit(-1);
	}
    program=program_check(program);
    
    ubyte[1024] mem;
    uint mem_count=0;

    for(uint program_count=0;program_count<program.length;program_count++)
    {
        switch(program[program_count]){
            case '>':
                mem_count++;
                break;
            case '<':
                mem_count--;
                break;
            case '+':
                mem[mem_count]++;
                break;
            case '-':
                mem[mem_count]--;
                break;
            case '.':
                putchar(mem[mem_count]);
                break;
            case ',':
                int temp = getchar();
                if(temp == EOF) return;
                mem[mem_count] = temp.to!ubyte;
                break;
            case '[':
                if(mem[mem_count]==0){
                    uint nest=0;
                    while(true){
                        program_count++;
                        if(program[program_count]=='[')
                            nest++;
                        if(program[program_count]==']'&&nest==0)
                            break;
                        if(program[program_count]==']')
                            nest--;                        
                    }
                }
                break;
            case ']':
                if(mem[mem_count]!=0){
                    uint nest=0;
                    while(true){
                        program_count--;
                        if(program[program_count]==']')
                            nest++;
                        if(program[program_count]=='['&&nest==0)
                            break;
                        if(program[program_count]=='[')
                            nest--;                        
                    }
                }
                break;
            default:
                break;
        }   
    }
}
unittest {
    interpreter_main(["","test/Correct Cases/Hello World.bf"]);
    interpreter_main(["","test/Incorrect Cases/Illegal_Char.bf"]);
    interpreter_main(["","test/Incorrect Cases/Incorrect_Block_Nest1.bf"]);
    interpreter_main(["","test/Incorrect Cases/Incorrect_Block_Nest2.bf"]);
}

void main(string[] args){

    interpreter_main(args);
}