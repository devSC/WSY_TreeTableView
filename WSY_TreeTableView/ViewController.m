//
//  ViewController.m
//  TestAutoLayoutTableView
//
//  Created by 袁仕崇 on 14/11/6.
//  Copyright (c) 2014年 wilson. All rights reserved.
//

//ios7上解决问题
//https://github.com/caoimghgin/TableViewCellWithAutoLayout
//autoLayout
//https://github.com/smileyborg/UIView-AutoLayout
//see this
//http://stackoverflow.com/questions/23496547/autolayout-uitableviewcell-in-landscape-and-on-ipad-calculating-height-based-on/23505951#23505951
#import "ViewController.h"
#import "WSYHeaderView.h"
#import "WSYAutoSizeCell.h"

@interface ViewController ()<WSYHeaderViewDelegate>

@property (nonatomic, strong) NSArray *stringArray;
@property (nonatomic, strong) NSArray *headerArray;
@property (nonatomic, strong) NSMutableArray *rowArray;

@property (assign, nonatomic) NSInteger openSection;

@property (strong, nonatomic) NSMutableDictionary *offscreenCells;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.offscreenCells = [NSMutableDictionary dictionary];

    //self update the cell height
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    // set the default row height
//    [self.tableView setEstimatedRowHeight:UITableViewAutomaticDimension];
    [self.tableView registerClass:[WSYAutoSizeCell class] forCellReuseIdentifier:@"WSYAutoSizeCell"];

    //set tableview dont selected
    self.tableView.allowsSelection = NO;

    
    NSString *string = @"Love your parents. We are too busy growing up yet we forget that they are already growing old \n多关心一下自己的父母吧，我们总忙着自己成长，却忘了他们也在变老。https://twitter.com";
    
   NSString *string2 = @" The moment you think about giving up,think of the reason why you held on so long\n每当你想放弃的时候，想一想是什么支撑着你一路坚持. https://twitter.com";
    
    
    NSString *string3 = @" I don't wanna be your 'number one' that implies there are a number two and maybe a number three. I want to be your only one\n我不想做你的“第一”，因为那就意味着还有第二，第三……我只想做你的“唯一”。";
    
    
    NSString *string4 = @" Total umbrella for someone else if he, you're just not for him in the rain.\n如果他总为别人撑伞，你又何苦非为他等在雨中。";
        
    NSString *string5 = @"Hold my hand,you won't get lost even with eyes closed. \n握住我的手，即使你閉上眼睛也不會迷路。\nNever put your happiness in someone else’s hands. \n永远不要把自己的幸福放在别人的手里。";
    
        
    NSString *string6 = @" We never really grow up. We only learn how to act in public. \n我们从未真正长大，我们只是在别人面前学会了假装。\n You keep on concentrating on the things you wish you had or things you wish you didn’t have and you sort of forget what you do have.-Nick Vujicic\n如果你不停的纠结于你所没有的或者不想要的，你就会忘记你真正拥有的。—尼克•胡哲\nOne of the best things in life is seeing a smile on a person’s face and knowing that you put it there——生活中最美好的一件事情是，因为你，某个人脸上洋溢着微笑。";
    
        
    NSString *string7 = @"Each trauma, is another kind of maturity. \n每一种创伤，都是另一种成熟。\nFortune favours the brave——运气往往眷顾勇敢的人。";
    
    
    self.stringArray = @[string, string2, string3, string4, string5, string6, string7];
    
    
    self.headerArray = @[string, string2, string3, string4, string5, string6, string7];
    self.rowArray = [[NSArray array] mutableCopy];
    
    
    _openSection = -1;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (_openSection == section) {
        return _rowArray.count;
    }
    return 0;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WSYAutoSizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WSYAutoSizeCell"];
//    // Configure the cell...
    [cell updateFonts];
    if (_openSection == indexPath.section) {
        cell.bodyLabel.attributedText = [self filterLinkWithContent:_rowArray[indexPath.row]];
//        cell.bodyLabel.text = _rowArray[indexPath.row];
    }

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}
- (NSMutableAttributedString *)filterLinkWithContent:(NSString *)content {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content];
    NSError *error = NULL;
    NSDataDetector *detector =
    [NSDataDetector dataDetectorWithTypes:(NSTextCheckingTypes)NSTextCheckingTypeLink | NSTextCheckingTypePhoneNumber
                                    error:&error];
    NSArray *matches = [detector matchesInString:content
                                                            options:0
                                           range:NSMakeRange(0, [content length])];
    for (NSTextCheckingResult *match in matches) {
        
        if (([match resultType] == NSTextCheckingTypeLink)) {
            
            NSURL *url = [match URL];
            [attributedString addAttribute:NSLinkAttributeName value:url range:match.range];
        }
    }
    return attributedString;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WSYHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"WSYHeaderView" owner:self options:nil] lastObject];
    [headerView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    headerView.conentLabel.text = _headerArray[section];
    headerView.section = section;
    headerView.delegate = self;
    headerView.cornView.layer.cornerRadius = 2;
    if (_openSection == section) {
        [headerView.arrowImage setImage:[UIImage imageNamed:@"buddy_header_arrow_down"]];
    }else{
        [headerView.arrowImage setImage:[UIImage imageNamed:@"buddy_header_arrow_right"]];
    }
    
    return headerView;
}

- (void)WSYHeaderView:(WSYHeaderView *)headerView didPressed:(NSInteger)section
{
    if (_openSection != section) {
        [_rowArray removeAllObjects];
        for (NSString *string in _headerArray) {
            [_rowArray addObject:string];
        }
        _openSection = section;
        [self.tableView reloadData];
    }else{
        [_rowArray removeAllObjects];
        _openSection = -1;
        [self.tableView reloadData];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This project has only one cell identifier, but if you are have more than one, this is the time
    // to figure out which reuse identifier should be used for the cell at this index path.
    NSString *reuseIdentifier = @"WSYAutoSizeCell";
    
    // Use the dictionary of offscreen cells to get a cell for the reuse identifier, creating a cell and storing
    // it in the dictionary if one hasn't already been added for the reuse identifier.
    // WARNING: Don't call the table view's dequeueReusableCellWithIdentifier: method here because this will result
    // in a memory leak as the cell is created but never returned from the tableView:cellForRowAtIndexPath: method!
//    WSYAutoSizeCell *cell = [self.offscreenCells objectForKey:reuseIdentifier];
//    if (!cell) {
//        cell = [[WSYAutoSizeCell alloc] init];
//        [self.offscreenCells setObject:cell forKey:reuseIdentifier];
//    }
    WSYAutoSizeCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    // Configure the cell for this indexPath
    [cell updateFonts];
    cell.bodyLabel.attributedText = [self filterLinkWithContent:_rowArray[indexPath.row]];
//    cell.bodyLabel.text = _rowArray[indexPath.row];

    
    // Make sure the constraints have been added to this cell, since it may have just been created from scratch
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    // The cell's width must be set to the same size it will end up at once it is in the table view.
    // This is important so that we'll get the correct height for different table view widths, since our cell's
    // height depends on its width due to the multi-line UILabel word wrapping. Don't need to do this above in
    // -[tableView:cellForRowAtIndexPath:] because it happens automatically when the cell is used in the table view.
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    // NOTE: if you are displaying a section index (e.g. alphabet along the right side of the table view), or
    // if you are using a grouped table view style where cells have insets to the edges of the table view,
    // you'll need to adjust the cell.bounds.size.width to be smaller than the full width of the table view we just
    // set it to above. See http://stackoverflow.com/questions/3647242 for discussion on the section index width.
    
    // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints
    // (Note that the preferredMaxLayoutWidth is set on multi-line UILabels inside the -[layoutSubviews] method
    // in the UITableViewCell subclass
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    // Get the actual height required for the cell
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // Add an extra point to the height to account for the cell separator, which is added between the bottom
    // of the cell's contentView and the bottom of the table view cell.
    height += 1;
    
    return height;
}


@end
