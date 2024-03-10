#include "mymath.h"

#include <gtest/gtest.h>

TEST(MyMath, Add) {
  EXPECT_EQ(add(4, 5), 9);
}
