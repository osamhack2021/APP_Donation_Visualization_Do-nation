/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS donation;
CREATE TABLE `donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `donor_name` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pay_won` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `targetId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e4d196fad5b527519f8a579d2e6` (`targetId`),
  CONSTRAINT `FK_e4d196fad5b527519f8a579d2e6` FOREIGN KEY (`targetId`) REFERENCES `target` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 101 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO
  donation(
    id,
    donor_name,
    message,
    phone,
    pay_won,
    password,
    targetId
  )
VALUES(
    1,
    'ruajr',
    'sflkl',
    '+82 10-0000-0000',
    65000,
    'nfdcb',
    6
  ),(
    2,
    'imwjj',
    'tbebn',
    '+82 10-0000-0000',
    40000,
    'mrwve',
    4
  ),(
    3,
    'cfncg',
    'ubebh',
    '+82 10-0000-0000',
    15000,
    'ynngj',
    2
  ),(
    4,
    'bkcpq',
    'vilgk',
    '+82 10-0000-0000',
    50000,
    'mxojh',
    8
  ),(
    5,
    'gusmg',
    'ygcza',
    '+82 10-0000-0000',
    35000,
    'ededb',
    9
  ),(
    6,
    'drory',
    'ccpjc',
    '+82 10-0000-0000',
    20000,
    'zygju',
    9
  ),(
    7,
    'tyvzm',
    'popfk',
    '+82 10-0000-0000',
    70000,
    'umkuo',
    2
  ),(
    8,
    'itung',
    'yuuvi',
    '+82 10-0000-0000',
    90000,
    'hopzw',
    10
  ),(
    9,
    'vecje',
    'rexkx',
    '+82 10-0000-0000',
    35000,
    'kamqh',
    3
  ),(
    10,
    'ouddb',
    'hediy',
    '+82 10-0000-0000',
    25000,
    'jgdvo',
    7
  ),(
    11,
    'ykxiw',
    'wexmx',
    '+82 10-0000-0000',
    80000,
    'xdpmp',
    3
  ),(
    12,
    'ljkhu',
    'corhz',
    '+82 10-0000-0000',
    40000,
    'tgwcn',
    5
  ),(
    13,
    'uacps',
    'zufvf',
    '+82 10-0000-0000',
    75000,
    'xomvk',
    3
  ),(
    14,
    'adqdi',
    'mqdzk',
    '+82 10-0000-0000',
    90000,
    'pvchi',
    8
  ),(
    15,
    'vsfwy',
    'agqlj',
    '+82 10-0000-0000',
    20000,
    'tzkku',
    2
  ),(
    16,
    'liten',
    'offtv',
    '+82 10-0000-0000',
    35000,
    'bdynr',
    3
  ),(
    17,
    'jwoth',
    'epyxx',
    '+82 10-0000-0000',
    25000,
    'ospnv',
    7
  ),(
    18,
    'ewqyi',
    'vkbfb',
    '+82 10-0000-0000',
    5000,
    'xsfpm',
    9
  ),(
    19,
    'rhnyj',
    'cidnc',
    '+82 10-0000-0000',
    45000,
    'xqabh',
    3
  ),(
    20,
    'xsern',
    'tyxxj',
    '+82 10-0000-0000',
    10000,
    'vzhsw',
    5
  ),(
    21,
    'aedpp',
    'pgnsx',
    '+82 10-0000-0000',
    85000,
    'dskhm',
    2
  ),(
    22,
    'paxsw',
    'gcsvd',
    '+82 10-0000-0000',
    85000,
    'wdgai',
    5
  ),(
    23,
    'daows',
    'unbum',
    '+82 10-0000-0000',
    20000,
    'ubqru',
    2
  ),(
    24,
    'hxibt',
    'rldhq',
    '+82 10-0000-0000',
    65000,
    'hydmw',
    5
  ),(
    25,
    'rqysg',
    'szbjx',
    '+82 10-0000-0000',
    90000,
    'mancu',
    5
  ),(
    26,
    'folcs',
    'wajdt',
    '+82 10-0000-0000',
    65000,
    'dsgik',
    6
  ),(
    27,
    'suzws',
    'rcose',
    '+82 10-0000-0000',
    85000,
    'hgshe',
    7
  ),(
    28,
    'rslpd',
    'xtcfj',
    '+82 10-0000-0000',
    30000,
    'wckzk',
    9
  ),(
    29,
    'rtbfc',
    'ounkl',
    '+82 10-0000-0000',
    70000,
    'nsion',
    5
  ),(
    30,
    'eeyil',
    'rgevd',
    '+82 10-0000-0000',
    45000,
    'kcjqc',
    8
  ),(
    31,
    'racrq',
    'fqqbi',
    '+82 10-0000-0000',
    60000,
    'mqqlp',
    10
  ),(
    32,
    'buwdr',
    'kvjtj',
    '+82 10-0000-0000',
    35000,
    'vjbsp',
    5
  ),(
    33,
    'kpndq',
    'hyhpk',
    '+82 10-0000-0000',
    20000,
    'gfhlw',
    2
  ),(
    34,
    'ztrkh',
    'lhgwd',
    '+82 10-0000-0000',
    50000,
    'jfsif',
    8
  ),(
    35,
    'souyn',
    'dtrtm',
    '+82 10-0000-0000',
    70000,
    'nolcd',
    3
  ),(
    36,
    'bqynf',
    'qflnx',
    '+82 10-0000-0000',
    40000,
    'tggox',
    9
  ),(
    37,
    'alyoq',
    'kgozq',
    '+82 10-0000-0000',
    70000,
    'mkosk',
    9
  ),(
    38,
    'cnimq',
    'nbidi',
    '+82 10-0000-0000',
    30000,
    'seipd',
    6
  ),(
    39,
    'xlcsw',
    'nkcjh',
    '+82 10-0000-0000',
    70000,
    'pxxgh',
    6
  ),(
    40,
    'jtsdp',
    'tadtx',
    '+82 10-0000-0000',
    65000,
    'unmpw',
    8
  ),(
    41,
    'pywwh',
    'whjso',
    '+82 10-0000-0000',
    55000,
    'qjghn',
    3
  ),(
    42,
    'rgmlu',
    'ppvbg',
    '+82 10-0000-0000',
    50000,
    'ydxay',
    6
  ),(
    43,
    'hnssq',
    'xcclb',
    '+82 10-0000-0000',
    90000,
    'pjzhq',
    3
  ),(
    44,
    'lcqph',
    'ioqit',
    '+82 10-0000-0000',
    90000,
    'nijdf',
    5
  ),(
    45,
    'fwqwq',
    'zmnyi',
    '+82 10-0000-0000',
    85000,
    'luoqc',
    6
  ),(
    46,
    'ecvsc',
    'pnhgn',
    '+82 10-0000-0000',
    70000,
    'uychi',
    9
  ),(
    47,
    'jmgfh',
    'jkeqz',
    '+82 10-0000-0000',
    20000,
    'wgckl',
    4
  ),(
    48,
    'lytde',
    'nsbjp',
    '+82 10-0000-0000',
    35000,
    'ldcdi',
    5
  ),(
    49,
    'suqvw',
    'jvmdn',
    '+82 10-0000-0000',
    10000,
    'jzmfl',
    3
  ),(
    50,
    'rnomn',
    'scita',
    '+82 10-0000-0000',
    35000,
    'tglji',
    4
  ),(
    51,
    'nbqve',
    'rollw',
    '+82 10-0000-0000',
    20000,
    'qrsxq',
    3
  ),(
    52,
    'mdkeg',
    'bgddr',
    '+82 10-0000-0000',
    60000,
    'qmeos',
    4
  ),(
    53,
    'hqqsh',
    'kxoty',
    '+82 10-0000-0000',
    55000,
    'uwazo',
    9
  ),(
    54,
    'hsfda',
    'uejqj',
    '+82 10-0000-0000',
    70000,
    'ebnwk',
    2
  ),(
    55,
    'lktqh',
    'pkexp',
    '+82 10-0000-0000',
    90000,
    'kjlto',
    2
  ),(
    56,
    'ctmti',
    'dpxfp',
    '+82 10-0000-0000',
    90000,
    'mvjue',
    6
  ),(
    57,
    'ywjmi',
    'odlhy',
    '+82 10-0000-0000',
    60000,
    'fmugj',
    8
  ),(
    58,
    'tlcxf',
    'tkovw',
    '+82 10-0000-0000',
    75000,
    'ivxgt',
    1
  ),(
    59,
    'hhnoq',
    'qcwtc',
    '+82 10-0000-0000',
    25000,
    'caxjc',
    8
  ),(
    60,
    'wvzbf',
    'vdbop',
    '+82 10-0000-0000',
    50000,
    'bftsl',
    3
  ),(
    61,
    'kvocz',
    'fgurw',
    '+82 10-0000-0000',
    30000,
    'tstjk',
    10
  ),(
    62,
    'ynjmg',
    'mcsdw',
    '+82 10-0000-0000',
    5000,
    'ddday',
    8
  ),(
    63,
    'xdjih',
    'rrlyd',
    '+82 10-0000-0000',
    65000,
    'gllxv',
    5
  ),(
    64,
    'bphyn',
    'mxsmw',
    '+82 10-0000-0000',
    35000,
    'qgoxy',
    6
  ),(
    65,
    'lovzc',
    'ukvhq',
    '+82 10-0000-0000',
    55000,
    'dyqcu',
    6
  ),(
    66,
    'eftbl',
    'obiuy',
    '+82 10-0000-0000',
    25000,
    'gbkui',
    4
  ),(
    67,
    'wwbyr',
    'okagg',
    '+82 10-0000-0000',
    75000,
    'zogyk',
    5
  ),(
    68,
    'ykoss',
    'yxpks',
    '+82 10-0000-0000',
    10000,
    'hypdg',
    2
  ),(
    69,
    'edfst',
    'drjjf',
    '+82 10-0000-0000',
    75000,
    'ujwcp',
    2
  ),(
    70,
    'msefr',
    'niodx',
    '+82 10-0000-0000',
    60000,
    'etmww',
    6
  ),(
    71,
    'uupwm',
    'xbkfs',
    '+82 10-0000-0000',
    35000,
    'xsgtt',
    9
  ),(
    72,
    'myfer',
    'crcfk',
    '+82 10-0000-0000',
    15000,
    'ubydl',
    2
  ),(
    73,
    'qoxqq',
    'yfbvt',
    '+82 10-0000-0000',
    95000,
    'cddvf',
    7
  ),(
    74,
    'kkrrt',
    'wuqjj',
    '+82 10-0000-0000',
    45000,
    'ltkqc',
    5
  ),(
    75,
    'gkdpx',
    'xafkp',
    '+82 10-0000-0000',
    35000,
    'wxwon',
    8
  ),(
    76,
    'ybifq',
    'lojpr',
    '+82 10-0000-0000',
    60000,
    'fswhr',
    4
  ),(
    77,
    'bkxfi',
    'blbaf',
    '+82 10-0000-0000',
    75000,
    'mbpra',
    5
  ),(
    78,
    'fjgqi',
    'dclqt',
    '+82 10-0000-0000',
    15000,
    'sbrin',
    8
  ),(
    79,
    'soviy',
    'aokqm',
    '+82 10-0000-0000',
    60000,
    'zzeuc',
    5
  ),(
    80,
    'nklrn',
    'bpknr',
    '+82 10-0000-0000',
    30000,
    'kbioi',
    3
  ),(
    81,
    'nyvzl',
    'ujtay',
    '+82 10-0000-0000',
    15000,
    'kftmg',
    6
  ),(
    82,
    'kecmc',
    'aierc',
    '+82 10-0000-0000',
    75000,
    'lrkjr',
    2
  ),(
    83,
    'zgrfj',
    'vrpwr',
    '+82 10-0000-0000',
    70000,
    'qkzuy',
    3
  ),(
    84,
    'yheji',
    'svfwn',
    '+82 10-0000-0000',
    10000,
    'jonru',
    8
  ),(
    85,
    'xcvap',
    'yjupp',
    '+82 10-0000-0000',
    40000,
    'mcqkx',
    5
  ),(
    86,
    'qoemp',
    'xeljm',
    '+82 10-0000-0000',
    90000,
    'xlbxt',
    3
  ),(
    87,
    'gvwmg',
    'vzrsg',
    '+82 10-0000-0000',
    75000,
    'csixp',
    8
  ),(
    88,
    'prtsx',
    'bbngi',
    '+82 10-0000-0000',
    10000,
    'zvune',
    1
  ),(
    89,
    'bmvev',
    'emkno',
    '+82 10-0000-0000',
    85000,
    'byhus',
    7
  ),(
    90,
    'qkrlf',
    'xofdk',
    '+82 10-0000-0000',
    10000,
    'lvast',
    5
  ),(
    91,
    'exzos',
    'uzsht',
    '+82 10-0000-0000',
    20000,
    'bgybv',
    3
  ),(
    92,
    'vekey',
    'uzhvz',
    '+82 10-0000-0000',
    60000,
    'mtwdx',
    8
  ),(
    93,
    'byobp',
    'xcsrs',
    '+82 10-0000-0000',
    65000,
    'cnudg',
    9
  ),(
    94,
    'vqjfa',
    'dhmol',
    '+82 10-0000-0000',
    60000,
    'pghpp',
    3
  ),(
    95,
    'mgjqi',
    'pcsxn',
    '+82 10-0000-0000',
    95000,
    'kpuow',
    8
  ),(
    96,
    'ifeog',
    'crrao',
    '+82 10-0000-0000',
    85000,
    'bmulu',
    5
  ),(
    97,
    'zzcgm',
    'fwksi',
    '+82 10-0000-0000',
    75000,
    'vdsyy',
    6
  ),(
    98,
    'rkcgs',
    'mruoh',
    '+82 10-0000-0000',
    60000,
    'mbfko',
    1
  ),(
    99,
    'ifshn',
    'tphrx',
    '+82 10-0000-0000',
    85000,
    'bwwjr',
    3
  ),(
    100,
    'acxyr',
    'dmfmg',
    '+82 10-0000-0000',
    45000,
    'tkccj',
    5
  );