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



module dut_unit_test;

  dut_unit_test_core #(.name("dut_1_BE"), .A(1), .V('hBE)) ut_core_1_BE();
  dut_unit_test_core #(.name("dut_2_CAFE"), .A(2), .V('hCAFE)) ut_core_2_CAFE();


  svunit_pkg::svunit_testsuite svunit_ut;

  function void build();
    svunit_ut = new("dut_unit_tests");
    svunit_ut.add_testcase(ut_core_1_BE.svunit_ut);
    svunit_ut.add_testcase(ut_core_2_CAFE.svunit_ut);
  endfunction

  task run();
    svunit_ut.run();
  endtask

endmodule
