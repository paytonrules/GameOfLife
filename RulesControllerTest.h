#import "GTMSenTestCase.h"
#import <OCMock/OCMock.h>
\
@interface RulesControllerTest : GTMTestCase
{
	RulesController *rulesController;
	OCMockObject		*parentViewController;
	OCMockObject		*rulesMock;
}
@end
