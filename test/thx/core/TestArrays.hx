/**
 * ...
 * @author Franco Ponticelli
 */

package thx.core;

import utest.Assert;
using thx.core.Arrays;

class TestArrays {
  public function new() { }

  public function testCrossMulti() {
    var r = [[1,2],[3,4],[5,6]].crossMulti();
    Assert.same([[1,3,5],[2,3,5],[1,4,5],[2,4,5],[1,3,6],[2,3,6],[1,4,6],[2,4,6]], r);
  }

  public function testMapField() {
    var arr  = [{a:1},{a:2},{a:3}],
        test = Arrays.pluck(arr, _.a);
    Assert.same([1,2,3], test);
  }

  public function testMapFieldOnFunction() {
    var test = Arrays.pluck([
          new Sample(2),
          new Sample(3),
          new Sample(4)
        ], _.multiply(2));
    Assert.same([4,6,8], test);
  }

  public function testUsingMapField() {
    var arr  = [{a:1},{a:2},{a:3}],
        test = arr.pluck(_.a);
    Assert.same([1,2,3], test);
  }

  public function testUsingMapFieldiOnFunction() {
    Assert.same(
        [0,3,8],
        [
          new Sample(2),
          new Sample(3),
          new Sample(4)
        ].plucki(_.multiply(i))
      );
  }

  public function testFilterPluck() {
    Assert.same([1,3,5], [1,2,3,4,5,6].filterPluck(_ % 2 != 0));
  }

  public function testPluck() {
    Assert.same([2,4,8], [1,2,4].pluck(_ * 2));
  }
}

private class Sample {
  var v : Int;
  public function new(v : Int)
    this.v = v;
  public function multiply(by : Int)
    return v * by;
}