// Code your testbench here
// or browse Examples

class generator;

  randc bit [3:0] a;
  rand bit wr; // write to memory
  rand bit oe;


  constraint wr_c {
    wr dist {0 := 50, 1 := 50};
                  }

  constraint oe_c {
    oe dist {1 := 50, 0 := 50};
                  }

  constraint wr_oe_c {
    ( wr == 1 ) <-> ( oe == 0 );
                      }

endclass


module tb;

  generator g;

  initial begin
    g= new();
    for(int i =0; i<10; i++) begin
      assert(g.randomize()) else $display("Randomization Failed");

      $display("Value of wr: %0b and oe: %0b", g.wr, g.oe);
    end
  end


endmodule
