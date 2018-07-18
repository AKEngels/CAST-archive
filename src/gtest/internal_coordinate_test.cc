#ifdef GOOGLE_MOCK

#include <gtest/gtest.h>

#include <tuple>
#include <vector>

#include "internal_coordinate_test.h"
#include "../ic_util.h"
#include "../ic_rotation.h"
#include "../scon_mathmatrix.h"
#include "TestFiles/ExpectedValuesForInternalCoordinatesTest.h"

namespace {
double constexpr doubleNearThreshold = 1.e-10;
coords::r3 constexpr r3NearThreshold{ doubleNearThreshold, doubleNearThreshold,
                                      doubleNearThreshold };
inline void isCartesianPointNear(coords::r3 const& lhs, coords::r3 const& rhs) {
  EXPECT_NEAR(lhs.x(), rhs.x(), doubleNearThreshold);
  EXPECT_NEAR(lhs.y(), rhs.y(), doubleNearThreshold);
  EXPECT_NEAR(lhs.z(), rhs.z(), doubleNearThreshold);
}

} // namespace

using namespace ExpectedValuesForInternalCoordinates;

SubsystemOfTwoMethanolMolecules::SubsystemOfTwoMethanolMolecules()
  : subSystem{ {createSystemOfTwoMethanolMolecules() }, 
                createSequenceOfSymbolsForTwoMethanolMolecules()} {
  subSystem.cartesianRepresentation /= energy::bohr2ang;
}

RotatetdMethanolMolecules::RotatetdMethanolMolecules()
    : initialMethanolSystem{ createInitialMethanolForRotationSystem(),
  createSequenceOfSymbolsForInitialMethanolForRotationSystem() },
      rotatedMethanolSystem{ createRotatedMethanolForRotationSystem(),
  createSequenceOfSymbolsForRotatedMethanolForRotationSystem() } {
  initialMethanolSystem.cartesianRepresentation /= energy::bohr2ang;
  rotatedMethanolSystem.cartesianRepresentation /= energy::bohr2ang;
}

InternalCoordinatesDistancesTest::InternalCoordinatesDistancesTest()
    : InternalCoordinatesTestSubsystem(), firstAtomDerivatives{ firstBondAtomDerivative() },
      secondAtomDerivatives{ secondBondAtomDerivative() },
      bond(1, 2, twoMethanolMolecules->getOneRepresentation().elementSymbols.at(0),
           twoMethanolMolecules->getOneRepresentation().elementSymbols.at(1)),
      derivativeVector(3u * 12u, 0.) {
  derivativeVector.at(0) = firstAtomDerivatives.x();
  derivativeVector.at(1) = firstAtomDerivatives.y();
  derivativeVector.at(2) = firstAtomDerivatives.z();
  derivativeVector.at(3) = secondAtomDerivatives.x();
  derivativeVector.at(4) = secondAtomDerivatives.y();
  derivativeVector.at(5) = secondAtomDerivatives.z();
}

double InternalCoordinatesDistancesTest::testBondLength() {
  return bond.val(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

std::pair<coords::r3, coords::r3> InternalCoordinatesDistancesTest::testBondDerivatives() {
  return bond.der(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

void InternalCoordinatesDistancesTest::derivativeVectorTest() {
  auto derivatives =
      bond.der_vec(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
  for (auto i = 1u; i < derivatives.size(); ++i) {
    EXPECT_NEAR(derivatives.at(i), derivativeVector.at(i), doubleNearThreshold);
  }
}

double InternalCoordinatesDistancesTest::hessianGuessTest() {
  return bond.hessian_guess(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

std::string InternalCoordinatesDistancesTest::returnInfoTest() {
  return bond.info(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

InternalCoordinatesAnglesTest::InternalCoordinatesAnglesTest()
    : InternalCoordinatesTestSubsystem(), leftAtomsDerivative{ leftAngleAtomDerivative() },
      middleAtomsDerivative{ middleAngleAtomDerivative() },
      rightAtomsDerivative{ rightAngleAtomDerivative() },
      angle(1, 2, 3, twoMethanolMolecules->getOneRepresentation().elementSymbols.at(0),
            twoMethanolMolecules->getOneRepresentation().elementSymbols.at(1),
            twoMethanolMolecules->getOneRepresentation().elementSymbols.at(2)),
      derivativeVector(3u * 12u, 0.) {
  derivativeVector.at(0) = leftAtomsDerivative.x();
  derivativeVector.at(1) = leftAtomsDerivative.y();
  derivativeVector.at(2) = leftAtomsDerivative.z();
  derivativeVector.at(3) = middleAtomsDerivative.x();
  derivativeVector.at(4) = middleAtomsDerivative.y();
  derivativeVector.at(5) = middleAtomsDerivative.z();
  derivativeVector.at(6) = rightAtomsDerivative.x();
  derivativeVector.at(7) = rightAtomsDerivative.y();
  derivativeVector.at(8) = rightAtomsDerivative.z();
}

double InternalCoordinatesAnglesTest::testAngleValue() {
  return angle.val(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

std::tuple<coords::r3, coords::r3, coords::r3> InternalCoordinatesAnglesTest::testAngleDerivatives() {
  return angle.der(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

void InternalCoordinatesAnglesTest::derivativeVectorTest() {
  auto derivatives =
      angle.der_vec(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
  for (auto i = 1u; i < derivatives.size(); ++i) {
    EXPECT_NEAR(derivatives.at(i), derivativeVector.at(i), doubleNearThreshold);
  }
}

double InternalCoordinatesAnglesTest::hessianGuessTest() {
  return angle.hessian_guess(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

std::string InternalCoordinatesAnglesTest::returnInfoTest() {
  return angle.info(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

InternalCoordinatesDihedralsTest::InternalCoordinatesDihedralsTest()
    : InternalCoordinatesTestSubsystem(), leftLeftDerivative{ leftLeftDihedralDerivative() },
      leftMiddleDerivative{ leftMiddleDihedralDerivative() },
      rightMiddleDerivative{ rightMiddleDihedralDerivative() },
      rightRightDerivative{ rightRightDihedralDerivative() },
      dihedralAngle(1, 2, 3, 4), derivativeVector(3u * 12u, 0.) {
  derivativeVector.at(0) = leftLeftDerivative.x();
  derivativeVector.at(1) = leftLeftDerivative.y();
  derivativeVector.at(2) = leftLeftDerivative.z();
  derivativeVector.at(3) = leftMiddleDerivative.x();
  derivativeVector.at(4) = leftMiddleDerivative.y();
  derivativeVector.at(5) = leftMiddleDerivative.z();
  derivativeVector.at(6) = rightMiddleDerivative.x();
  derivativeVector.at(7) = rightMiddleDerivative.y();
  derivativeVector.at(8) = rightMiddleDerivative.z();
  derivativeVector.at(9) = rightRightDerivative.x();
  derivativeVector.at(10) = rightRightDerivative.y();
  derivativeVector.at(11) = rightRightDerivative.z();
}

double InternalCoordinatesDihedralsTest::testDihedralValue() {
  return dihedralAngle.val(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

std::tuple<coords::r3, coords::r3, coords::r3, coords::r3>
InternalCoordinatesDihedralsTest::testDihedralDerivatives() {
  return dihedralAngle.der(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

void InternalCoordinatesDihedralsTest::derivativeVectorTest() {
  auto derivatives = dihedralAngle.der_vec(
      twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
  for (auto i = 1u; i < derivatives.size(); ++i) {
    EXPECT_NEAR(derivatives.at(i), derivativeVector.at(i), doubleNearThreshold);
  }
}

double InternalCoordinatesDihedralsTest::hessianGuessTest() {
  return dihedralAngle.hessian_guess(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

std::string InternalCoordinatesDihedralsTest::returnInfoTest() {
  return dihedralAngle.info(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

InternalCoordinatesTranslationTest::InternalCoordinatesTranslationTest() : InternalCoordinatesTestSubsystem(), translation{ { 1u,2u,3u,4u,5u,6u } } {}

void InternalCoordinatesTranslationTest::testTranslationDerivativeTest() {

  auto flattenedVector = ic_util::flatten_c3_vec(translation.der(6, [](auto const & s) {
    auto doubleS = static_cast<double>(s);
    return coords::r3(1. / doubleS, 2. / doubleS, 3. / doubleS);
  }));

  std::vector<double> someTestValues;

  for (auto i = 0; i < 6; ++i) {
    someTestValues.emplace_back(1. / static_cast<double>(translation.indices_.size()));
    someTestValues.emplace_back(2. / static_cast<double>(translation.indices_.size()));
    someTestValues.emplace_back(3. / static_cast<double>(translation.indices_.size()));
  }

  for (auto i = 1u; i < flattenedVector.size(); ++i) {
    EXPECT_NEAR(flattenedVector.at(i), someTestValues.at(i), doubleNearThreshold);
  }

}

double InternalCoordinatesTranslationTest::hessianGuessTest() {
  return translation.hessian_guess(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

InternalCoordinatesTranslationXTest::InternalCoordinatesTranslationXTest() : InternalCoordinatesTestSubsystem(), translation{ {1u,2u,3u,4u,5u,6u} },
derivativeVector(3u*12u,0.) {
  auto constexpr sizeOfMethanolWhichIsDescribed = 3u * 12u / 2u;
  for (auto i = 0u; i < sizeOfMethanolWhichIsDescribed; i += 3) {
    derivativeVector.at(i) = 0.16666666666666666;
  }
}

double InternalCoordinatesTranslationXTest::testTranslationValue() {
  return translation.val(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

void InternalCoordinatesTranslationXTest::derivativeVectorTest() {
  auto derivatives = translation.der_vec(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
  for (auto i = 0u; i < derivatives.size(); ++i) {
    EXPECT_NEAR(derivatives.at(i), derivativeVector.at(i), doubleNearThreshold);
  }
}

std::string InternalCoordinatesTranslationXTest::returnInfoTest() {
  return translation.info(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

InternalCoordinatesTranslationYTest::InternalCoordinatesTranslationYTest() : InternalCoordinatesTestSubsystem(), translation{ { 1u,2u,3u,4u,5u,6u } },
derivativeVector(3u * 12u, 0.) {
  auto constexpr sizeOfMethanolWhichIsDescribed = 3u * 12u / 2u;
  for (auto i = 1u; i < sizeOfMethanolWhichIsDescribed; i += 3) {
    derivativeVector.at(i) = 0.16666666666666666;
  }
}

double InternalCoordinatesTranslationYTest::testTranslationValue() {
  return translation.val(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

void InternalCoordinatesTranslationYTest::derivativeVectorTest() {
  auto derivatives = translation.der_vec(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
  for (auto i = 0u; i < derivatives.size(); ++i) {
    EXPECT_NEAR(derivatives.at(i), derivativeVector.at(i), doubleNearThreshold);
  }
}

std::string InternalCoordinatesTranslationYTest::returnInfoTest() {
  return translation.info(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

InternalCoordinatesTranslationZTest::InternalCoordinatesTranslationZTest() : InternalCoordinatesTestSubsystem(), translation{ { 1u,2u,3u,4u,5u,6u } },
derivativeVector(3u * 12u, 0.) {
  auto constexpr sizeOfMethanolWhichIsDescribed = 3u * 12u / 2u;
  for (auto i = 2u; i < sizeOfMethanolWhichIsDescribed; i += 3) {
    derivativeVector.at(i) = 0.16666666666666666;
  }
}

double InternalCoordinatesTranslationZTest::testTranslationValue() {
  return translation.val(twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

void InternalCoordinatesTranslationZTest::derivativeVectorTest() {
  auto derivatives = translation.der_vec(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
  for (auto i = 0u; i < derivatives.size(); ++i) {
    EXPECT_NEAR(derivatives.at(i), derivativeVector.at(i), doubleNearThreshold);
  }
}

std::string InternalCoordinatesTranslationZTest::returnInfoTest() {
  return translation.info(
    twoMethanolMolecules->getOneRepresentation().cartesianRepresentation);
}

InternalCoordinatesRotationTest::InternalCoordinatesRotationTest()
    : InternalCoordinatesTestRotatedMolecules(),
      rotation(twoMethanolMolecules->getTwoRepresentations()
                   .first.cartesianRepresentation,
        std::vector<std::size_t>{ 1, 2, 3, 4, 5, 6 }) {}

double InternalCoordinatesRotationTest::testRadiusOfGyration()
{
  return rotation.radiusOfGyration(twoMethanolMolecules->getTwoRepresentations()
    .first.cartesianRepresentation);
}

void InternalCoordinatesRotationTest::testRotationValue(){
  auto rotationsForXyz = rotation.valueOfInternalCoordinate(twoMethanolMolecules->getTwoRepresentations().second.cartesianRepresentation);
  std::array<double, 3u> expectedValues = { -3.1652558307984515, -2.4287895503201611, 3.1652568986800538 };
  for (auto i = 0u; i < rotationsForXyz.size(); ++i) {
    EXPECT_NEAR(rotationsForXyz.at(i), expectedValues.at(i), doubleNearThreshold);
  }
}

void InternalCoordinatesRotationTest::testRotationDerivatives(){
  auto rotationDerivatives = rotation.rot_der_mat(6u,twoMethanolMolecules->getTwoRepresentations().second.cartesianRepresentation);
  EXPECT_EQ(rotationDerivatives, expectedRotationDerivatives());
}

void CorrelationTests::testCorrelationMatrix() {
  auto correlationMatrix = ic_rotation::correlation_matrix(
      twoMethanolMolecules->getTwoRepresentations()
          .first.cartesianRepresentation,
      twoMethanolMolecules->getTwoRepresentations()
          .second.cartesianRepresentation);

  scon::mathmatrix<double> expectedValues{
    { 3.62870631512344, 6.77810459455176, -3.11427207160589 },
    { 3.03723523986651, -0.65557765262001, -7.29126193241831 },
    { -16.1308283716317, -2.71895876607409, 3.87293765244782 }
  };

  EXPECT_EQ(correlationMatrix, expectedValues);
}

void CorrelationTests::testFMatrix() {

  // Maybe Mock the F_matrix method to not calculate the correlation Matrix
  // explicitly?
  auto F = ic_rotation::F_matrix(twoMethanolMolecules->getTwoRepresentations()
                                     .first.cartesianRepresentation,
                                 twoMethanolMolecules->getTwoRepresentations()
                                     .second.cartesianRepresentation);

  scon::mathmatrix<double> expectedValues = expectedValuesForF();

  EXPECT_EQ(F, expectedValues);

  auto eigenVectorsAndValuesOfF = F.eigensym();

  scon::mathmatrix<double> expectedEigenValues = expectedEigenValuesForF();

  scon::mathmatrix<double> expectedEigenVectors = expectedEigenVectorsForF();

  EXPECT_EQ(eigenVectorsAndValuesOfF.first, expectedEigenValues);
  EXPECT_EQ(eigenVectorsAndValuesOfF.second, expectedEigenVectors);

}

void CorrelationTests::testExopentialMap() {
  auto exponentialMap = ic_rotation::exponential_map(twoMethanolMolecules->getTwoRepresentations().first.cartesianRepresentation, twoMethanolMolecules->getTwoRepresentations().second.cartesianRepresentation);
  std::array<double, 3u> expectedValues = { -1.3993943532121675, -1.0737945251652472, 1.3993948253343480 };
  for (auto i = 0u; i < exponentialMap.size(); ++i) {
    EXPECT_NEAR(exponentialMap.at(i), expectedValues.at(i), doubleNearThreshold);
  }
}

void CorrelationTests::testQuaternionForTwoMolecules() {
  auto quaternion = ic_rotation::quaternion(twoMethanolMolecules->getTwoRepresentations().first.cartesianRepresentation, twoMethanolMolecules->getTwoRepresentations().second.cartesianRepresentation);

  std::array<double, 4u> expectedValuesForTheQuaternion{ 0.43046032188591526, -0.56098498624527438, -0.43045950953522794, 0.56098517550818972 };
  for (auto i = 0u; i < expectedValuesForTheQuaternion.size(); ++i) {
    EXPECT_NEAR(quaternion.second.at(i), expectedValuesForTheQuaternion.at(i), doubleNearThreshold);
  }

  double expectedValueForTheHighestEigenvalueOfF = 30.696501765398882;
  EXPECT_NEAR(quaternion.first, expectedValueForTheHighestEigenvalueOfF, doubleNearThreshold);
}

void CorrelationTests::testCorrelationMatrixDerivatives() {
  auto const& cartesians = twoMethanolMolecules->getTwoRepresentations().first.cartesianRepresentation;
  auto derives = ic_rotation::correlation_matrix_derivs(cartesians);

  std::vector<scon::mathmatrix<double> > containerForRowsOfCartesianRepresentation;
  
  for (auto const& atom : cartesians) {
    containerForRowsOfCartesianRepresentation.emplace_back(scon::mathmatrix<double>{ {atom.x(), atom.y(), atom.z()} });
  }

  auto constexpr numberOfCartesiansPerRow = 3u;

  for (auto i = 0u; i < containerForRowsOfCartesianRepresentation.size(); ++i) {
    auto & expectedRow = containerForRowsOfCartesianRepresentation.at(i);
    for (auto j = 0u; j < numberOfCartesiansPerRow; ++j) {
      EXPECT_EQ(derives.at(i).at(j).row(j), expectedRow);
    }
  }

}

void CorrelationTests::testFMatrixDerivatives(){
  using namespace ExpectedValuesForInternalCoordinates;
  std::istringstream matrixStreamWithDerivatives(provideExpectedValuesForFMatrixDerivativesInFile());
  auto Fderivatives = ic_rotation::F_matrix_derivs(twoMethanolMolecules->getTwoRepresentations().first.cartesianRepresentation);

  for (auto i = 0u; i < Fderivatives.size(); ++i) {
    for (auto j = 0u; j < Fderivatives.at(i).size(); ++j) {
      auto expectedDerivative = readNextFderivative(matrixStreamWithDerivatives);
      EXPECT_EQ(Fderivatives.at(i).at(j), expectedDerivative);
    }
  }
}

void CorrelationTests::testQuaternionDerivatives(){
  using namespace ExpectedValuesForInternalCoordinates;
  std::istringstream matrixStreamWithDerivatives(provideExpectedValuesForQuaternionDerivatives());
  auto quaternionDerivatives = ic_rotation::quaternion_derivs(twoMethanolMolecules->getTwoRepresentations().first.cartesianRepresentation, twoMethanolMolecules->getTwoRepresentations().second.cartesianRepresentation);
  for (auto i = 0u; i < quaternionDerivatives.size(); ++i) {
    auto expectedDerivative = readNextQuaternionDerivative(matrixStreamWithDerivatives);
    EXPECT_EQ(quaternionDerivatives.at(i), expectedDerivative);
  }
}

void CorrelationTests::testExponentialMapDerivatives(){

  using namespace ExpectedValuesForInternalCoordinates;
  std::istringstream matrixStreamWithDerivatives(provideExpectedValuesForExponentialMapDerivatives());
  auto exponentialMapDerivatives = ic_rotation::exponential_derivs(twoMethanolMolecules->getTwoRepresentations().first.cartesianRepresentation, twoMethanolMolecules->getTwoRepresentations().second.cartesianRepresentation);
  for (auto i = 0u; i < exponentialMapDerivatives.size(); ++i) {
    auto expectedDerivative = readNextExponentialMapderivative(matrixStreamWithDerivatives);
    EXPECT_EQ(exponentialMapDerivatives.at(i), expectedDerivative);
  }

}

scon::mathmatrix<double> CorrelationTests::readNextFderivative(std::istream & inputFileStream){
  auto constexpr sizeOfDerivatives = 4u;
  return ReadMatrixFiles(inputFileStream).readNLinesOfFileWithMNumbers(sizeOfDerivatives, sizeOfDerivatives);
}

scon::mathmatrix<double> CorrelationTests::readNextQuaternionDerivative(std::istream & inputFileStream) {
  auto constexpr sizeOfDerivativeRows = 3u;
  auto constexpr sizeOfDerivativeCols = 4u;
  return ReadMatrixFiles(inputFileStream).readNLinesOfFileWithMNumbers(sizeOfDerivativeRows, sizeOfDerivativeCols);
}

scon::mathmatrix<double> CorrelationTests::readNextExponentialMapderivative(std::istream & inputFileStream) {
  auto constexpr sizeOfDerivatives = 3u;
  return ReadMatrixFiles(inputFileStream).readNLinesOfFileWithMNumbers(sizeOfDerivatives, sizeOfDerivatives);
}

scon::mathmatrix<double> CorrelationTests::ReadMatrixFiles::readNLinesOfFileWithMNumbers(std::size_t const n, std::size_t const m)
{
  scon::mathmatrix<double> nextMatrix(n, m);

  for (auto i = 0u; i < n; ++i) {
    std::string line;
    std::getline(inputStream, line);
    std::stringstream lineStream(line);

    for (auto j = 0u; j < m; ++j) lineStream >> nextMatrix(i, j);
  }

  return nextMatrix;
}

TEST_F(InternalCoordinatesDistancesTest, testBondLength) {
  EXPECT_NEAR(testBondLength(), 2.6414241359371124, doubleNearThreshold);
}

TEST_F(InternalCoordinatesDistancesTest, testBondDerivatives) {
  std::pair<coords::r3, coords::r3> testValuesForDerivatives;

  auto bondDerivatives = testBondDerivatives();

  isCartesianPointNear(bondDerivatives.first, firstAtomDerivatives);
  isCartesianPointNear(bondDerivatives.second, secondAtomDerivatives);
}

TEST_F(InternalCoordinatesDistancesTest, derivativeVectorTest) {
  derivativeVectorTest();
}

TEST_F(InternalCoordinatesDistancesTest, hessianGuessTest) {
  EXPECT_NEAR(hessianGuessTest(), 0.45990191969419725, doubleNearThreshold);
}

TEST_F(InternalCoordinatesDistancesTest, returnInfoTest) {
  EXPECT_EQ(returnInfoTest(), "Bond: 2.64142 || 1 || 2 ||");
}

TEST_F(InternalCoordinatesAnglesTest, testAngleValue) {
  EXPECT_NEAR(testAngleValue(), 0.52901078997179563, doubleNearThreshold);
}

TEST_F(InternalCoordinatesAnglesTest, testAngleDerivatives) {
  std::tuple<coords::r3, coords::r3, coords::r3> testValuesForDerivatives;

  auto angleDerivatives = testAngleDerivatives();

  isCartesianPointNear(std::get<0>(angleDerivatives), leftAtomsDerivative);
  isCartesianPointNear(std::get<1>(angleDerivatives), middleAtomsDerivative);
  isCartesianPointNear(std::get<2>(angleDerivatives), rightAtomsDerivative);
}

TEST_F(InternalCoordinatesAnglesTest, derivativeVectorTest) {
  derivativeVectorTest();
}

TEST_F(InternalCoordinatesAnglesTest, hessianGuessTest) {
  EXPECT_NEAR(hessianGuessTest(), 0.16, doubleNearThreshold);
}

TEST_F(InternalCoordinatesAnglesTest, returnInfoTest) {
  EXPECT_EQ(returnInfoTest(), "Angle: 30.3101 || 1 || 2 || 3 ||");
}

TEST_F(InternalCoordinatesDihedralsTest, testDihedralValue) {
  EXPECT_NEAR(testDihedralValue(), 0.56342327253755953, doubleNearThreshold);
}

TEST_F(InternalCoordinatesDihedralsTest, testDihedralDerivatives) {
  std::tuple<coords::r3, coords::r3, coords::r3> testValuesForDerivatives;

  auto dihedralDerivatives = testDihedralDerivatives();

  isCartesianPointNear(std::get<0>(dihedralDerivatives), leftLeftDerivative);
  isCartesianPointNear(std::get<1>(dihedralDerivatives), leftMiddleDerivative);
  isCartesianPointNear(std::get<2>(dihedralDerivatives), rightMiddleDerivative);
  isCartesianPointNear(std::get<3>(dihedralDerivatives), rightRightDerivative);
}

TEST_F(InternalCoordinatesDihedralsTest, derivativeVectorTest) {
  derivativeVectorTest();
}

TEST_F(InternalCoordinatesDihedralsTest, hessianGuessTest) {
  EXPECT_NEAR(hessianGuessTest(), 0.023, doubleNearThreshold);
}

TEST_F(InternalCoordinatesDihedralsTest, returnInfoTest) {
  EXPECT_EQ(returnInfoTest(), "Dihedral: 32.2818 || 1 || 2 || 3 || 4 ||");
}

TEST_F(InternalCoordinatesTranslationTest, testTranslationDerivativeTest) {
  testTranslationDerivativeTest();
}

TEST_F(InternalCoordinatesTranslationTest, hessianGuessTest) {
  EXPECT_NEAR(hessianGuessTest(), 0.05, doubleNearThreshold);
}

TEST_F(InternalCoordinatesTranslationXTest, testTranslationValue) {
  EXPECT_NEAR(testTranslationValue(), -10.831910151124269, doubleNearThreshold);
}

TEST_F(InternalCoordinatesTranslationXTest, derivativeVectorTest) {
  derivativeVectorTest();
}

TEST_F(InternalCoordinatesTranslationXTest, returnInfoTest) {
  EXPECT_EQ(returnInfoTest(), "Trans X: -10.8319");
}

TEST_F(InternalCoordinatesTranslationYTest, testTranslationValue) {
  EXPECT_NEAR(testTranslationValue(), -0.44786509173350525, doubleNearThreshold);
}

TEST_F(InternalCoordinatesTranslationYTest, derivativeVectorTest) {
  derivativeVectorTest();
}

TEST_F(InternalCoordinatesTranslationYTest, returnInfoTest) {
  EXPECT_EQ(returnInfoTest(), "Trans Y: -0.447865");
}

TEST_F(InternalCoordinatesTranslationZTest, testTranslationValue) {
  EXPECT_NEAR(testTranslationValue(), -0.44471554819107562, doubleNearThreshold);
}

TEST_F(InternalCoordinatesTranslationZTest, derivativeVectorTest) {
  derivativeVectorTest();
}

TEST_F(InternalCoordinatesTranslationZTest, returnInfoTest) {
  EXPECT_EQ(returnInfoTest(), "Trans Z: -0.444716");
}

TEST_F(InternalCoordinatesRotationTest, testRadiusOfGyration) {
  EXPECT_NEAR(testRadiusOfGyration(), 2.2618755203155767, doubleNearThreshold);
}

TEST_F(InternalCoordinatesRotationTest, testRotationValue) {
  testRotationValue();
}

TEST_F(InternalCoordinatesRotationTest, testRotationDerivatives) {
  testRotationDerivatives();
}

TEST_F(CorrelationTests, testCorrelationMatrix) {
  testCorrelationMatrix();
}

TEST_F(CorrelationTests, testExopentialMap) {
  testExopentialMap();
}

TEST_F(CorrelationTests, testFMatrix) {
  testFMatrix();
}

TEST_F(CorrelationTests, testQuaternionForTwoMolecules) {
  testQuaternionForTwoMolecules();
}

TEST_F(CorrelationTests, testCorrelationMatrixDerivatives) {
  testCorrelationMatrixDerivatives();
}

TEST_F(CorrelationTests, testFMatrixDerivatives) {
  testFMatrixDerivatives();
}

TEST_F(CorrelationTests, testQuaternionDerivatives) {
  testQuaternionDerivatives();
}

TEST_F(CorrelationTests, testExponentialMapDerivatives) {
  testExponentialMapDerivatives();
}

#endif


