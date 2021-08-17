module dut_2_CAFE_unit_test;

  dut_unit_test_core #(.name("dut_2_CAFE"), .A(2), .V('hCAFE)) ut_core();

  svunit_pkg::svunit_testcase svunit_ut;

  function void build();
    ut_core.build();
    svunit_ut = ut_core.svunit_ut;
  endfunction

  task run();
    ut_core.run();
  endtask

endmodule
