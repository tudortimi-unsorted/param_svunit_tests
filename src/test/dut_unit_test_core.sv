module dut_unit_test_core #(
    string name = "dut_unit_test",
    int A = 0,
    type T = int,
    T V = '1);

  import svunit_pkg::*;
  `include "svunit_defines.svh"

  svunit_testcase svunit_ut;

  dut #(A, T, V) my_dut();


  function void build();
    svunit_ut = new(name);
  endfunction

  task setup();
    svunit_ut.setup();
  endtask

  task teardown();
    svunit_ut.teardown();
  endtask


  `SVUNIT_TESTS_BEGIN

    `SVTEST(print)
      my_dut.print();
    `SVTEST_END

    `SVTEST(fail_for_param_value)
      `FAIL_IF (A==1)
    `SVTEST_END

  `SVUNIT_TESTS_END

endmodule
