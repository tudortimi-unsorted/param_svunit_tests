module dut_1_BE_unit_test;

  dut_unit_test_core #(.name("dut_1_BE"), .A(1), .V('hBE)) ut_core();

  svunit_pkg::svunit_testcase svunit_ut;

  function void build();
    ut_core.build();
    svunit_ut = ut_core.svunit_ut;
  endfunction

  task run();
    ut_core.run();
  endtask

endmodule
