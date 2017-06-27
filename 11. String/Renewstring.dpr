program Renewstring;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  S, P: string;                 { S: main string; P: copied string }
  I, N, Count: Integer;         { Count: length of string S }
                                { N: position of last word  }
                                { I: counting variable      }

begin
   (* Input process *)
  WriteLn('INPUT STRING: '); WriteLn;
  ReadLn(S); WriteLn;

  Count := Length(S);               // identify length of string

  // MAIN
  N := 0; I := 1;
  repeat
      (* find word and change it *)
    if ((S[I] <> ' ') and (S[I+1] = ' ')) or (I = Count) then
      begin
        P := Copy(S, N+2,I-N-1);    // make a copy of necessary letters
        Delete(S, N+2, I-N-1);      // delete copy
        Insert(P,S,N+1);            // insert copy in correct position
        N := I;                     // make new value of N
      end;

    if S[I] = ' ' then              // increase N when space appears
      Inc(N);

    Inc(I);                         // count up
  until I = Count+1;

  WriteLn(S); ReadLn;
end.
 