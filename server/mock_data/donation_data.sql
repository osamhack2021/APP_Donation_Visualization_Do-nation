/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS donation;
CREATE TABLE `donation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `target_id` int NOT NULL,
  `donor_name` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pay_won` int NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 101 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
INSERT INTO
  donation(
    id,
    target_id,
    donor_name,
    message,
    phone,
    pay_won,
    password
  )
VALUES(
    1,
    6,
    'ruajr',
    'sflkl',
    '+82 10-0000-0000',
    65000,
    'nfdcb'
  ),(
    2,
    4,
    'imwjj',
    'tbebn',
    '+82 10-0000-0000',
    40000,
    'mrwve'
  ),(
    3,
    2,
    'cfncg',
    'ubebh',
    '+82 10-0000-0000',
    15000,
    'ynngj'
  ),(
    4,
    8,
    'bkcpq',
    'vilgk',
    '+82 10-0000-0000',
    50000,
    'mxojh'
  ),(
    5,
    9,
    'gusmg',
    'ygcza',
    '+82 10-0000-0000',
    35000,
    'ededb'
  ),(
    6,
    9,
    'drory',
    'ccpjc',
    '+82 10-0000-0000',
    20000,
    'zygju'
  ),(
    7,
    2,
    'tyvzm',
    'popfk',
    '+82 10-0000-0000',
    70000,
    'umkuo'
  ),(
    8,
    10,
    'itung',
    'yuuvi',
    '+82 10-0000-0000',
    90000,
    'hopzw'
  ),(
    9,
    3,
    'vecje',
    'rexkx',
    '+82 10-0000-0000',
    35000,
    'kamqh'
  ),(
    10,
    7,
    'ouddb',
    'hediy',
    '+82 10-0000-0000',
    25000,
    'jgdvo'
  ),(
    11,
    3,
    'ykxiw',
    'wexmx',
    '+82 10-0000-0000',
    80000,
    'xdpmp'
  ),(
    12,
    5,
    'ljkhu',
    'corhz',
    '+82 10-0000-0000',
    40000,
    'tgwcn'
  ),(
    13,
    3,
    'uacps',
    'zufvf',
    '+82 10-0000-0000',
    75000,
    'xomvk'
  ),(
    14,
    8,
    'adqdi',
    'mqdzk',
    '+82 10-0000-0000',
    90000,
    'pvchi'
  ),(
    15,
    2,
    'vsfwy',
    'agqlj',
    '+82 10-0000-0000',
    20000,
    'tzkku'
  ),(
    16,
    3,
    'liten',
    'offtv',
    '+82 10-0000-0000',
    35000,
    'bdynr'
  ),(
    17,
    7,
    'jwoth',
    'epyxx',
    '+82 10-0000-0000',
    25000,
    'ospnv'
  ),(
    18,
    9,
    'ewqyi',
    'vkbfb',
    '+82 10-0000-0000',
    5000,
    'xsfpm'
  ),(
    19,
    3,
    'rhnyj',
    'cidnc',
    '+82 10-0000-0000',
    45000,
    'xqabh'
  ),(
    20,
    5,
    'xsern',
    'tyxxj',
    '+82 10-0000-0000',
    10000,
    'vzhsw'
  ),(
    21,
    2,
    'aedpp',
    'pgnsx',
    '+82 10-0000-0000',
    85000,
    'dskhm'
  ),(
    22,
    5,
    'paxsw',
    'gcsvd',
    '+82 10-0000-0000',
    85000,
    'wdgai'
  ),(
    23,
    2,
    'daows',
    'unbum',
    '+82 10-0000-0000',
    20000,
    'ubqru'
  ),(
    24,
    5,
    'hxibt',
    'rldhq',
    '+82 10-0000-0000',
    65000,
    'hydmw'
  ),(
    25,
    5,
    'rqysg',
    'szbjx',
    '+82 10-0000-0000',
    90000,
    'mancu'
  ),(
    26,
    6,
    'folcs',
    'wajdt',
    '+82 10-0000-0000',
    65000,
    'dsgik'
  ),(
    27,
    7,
    'suzws',
    'rcose',
    '+82 10-0000-0000',
    85000,
    'hgshe'
  ),(
    28,
    9,
    'rslpd',
    'xtcfj',
    '+82 10-0000-0000',
    30000,
    'wckzk'
  ),(
    29,
    5,
    'rtbfc',
    'ounkl',
    '+82 10-0000-0000',
    70000,
    'nsion'
  ),(
    30,
    8,
    'eeyil',
    'rgevd',
    '+82 10-0000-0000',
    45000,
    'kcjqc'
  ),(
    31,
    10,
    'racrq',
    'fqqbi',
    '+82 10-0000-0000',
    60000,
    'mqqlp'
  ),(
    32,
    5,
    'buwdr',
    'kvjtj',
    '+82 10-0000-0000',
    35000,
    'vjbsp'
  ),(
    33,
    2,
    'kpndq',
    'hyhpk',
    '+82 10-0000-0000',
    20000,
    'gfhlw'
  ),(
    34,
    8,
    'ztrkh',
    'lhgwd',
    '+82 10-0000-0000',
    50000,
    'jfsif'
  ),(
    35,
    3,
    'souyn',
    'dtrtm',
    '+82 10-0000-0000',
    70000,
    'nolcd'
  ),(
    36,
    9,
    'bqynf',
    'qflnx',
    '+82 10-0000-0000',
    40000,
    'tggox'
  ),(
    37,
    9,
    'alyoq',
    'kgozq',
    '+82 10-0000-0000',
    70000,
    'mkosk'
  ),(
    38,
    6,
    'cnimq',
    'nbidi',
    '+82 10-0000-0000',
    30000,
    'seipd'
  ),(
    39,
    6,
    'xlcsw',
    'nkcjh',
    '+82 10-0000-0000',
    70000,
    'pxxgh'
  ),(
    40,
    8,
    'jtsdp',
    'tadtx',
    '+82 10-0000-0000',
    65000,
    'unmpw'
  ),(
    41,
    3,
    'pywwh',
    'whjso',
    '+82 10-0000-0000',
    55000,
    'qjghn'
  ),(
    42,
    6,
    'rgmlu',
    'ppvbg',
    '+82 10-0000-0000',
    50000,
    'ydxay'
  ),(
    43,
    3,
    'hnssq',
    'xcclb',
    '+82 10-0000-0000',
    90000,
    'pjzhq'
  ),(
    44,
    5,
    'lcqph',
    'ioqit',
    '+82 10-0000-0000',
    90000,
    'nijdf'
  ),(
    45,
    6,
    'fwqwq',
    'zmnyi',
    '+82 10-0000-0000',
    85000,
    'luoqc'
  ),(
    46,
    9,
    'ecvsc',
    'pnhgn',
    '+82 10-0000-0000',
    70000,
    'uychi'
  ),(
    47,
    4,
    'jmgfh',
    'jkeqz',
    '+82 10-0000-0000',
    20000,
    'wgckl'
  ),(
    48,
    5,
    'lytde',
    'nsbjp',
    '+82 10-0000-0000',
    35000,
    'ldcdi'
  ),(
    49,
    3,
    'suqvw',
    'jvmdn',
    '+82 10-0000-0000',
    10000,
    'jzmfl'
  ),(
    50,
    4,
    'rnomn',
    'scita',
    '+82 10-0000-0000',
    35000,
    'tglji'
  ),(
    51,
    3,
    'nbqve',
    'rollw',
    '+82 10-0000-0000',
    20000,
    'qrsxq'
  ),(
    52,
    4,
    'mdkeg',
    'bgddr',
    '+82 10-0000-0000',
    60000,
    'qmeos'
  ),(
    53,
    9,
    'hqqsh',
    'kxoty',
    '+82 10-0000-0000',
    55000,
    'uwazo'
  ),(
    54,
    2,
    'hsfda',
    'uejqj',
    '+82 10-0000-0000',
    70000,
    'ebnwk'
  ),(
    55,
    2,
    'lktqh',
    'pkexp',
    '+82 10-0000-0000',
    90000,
    'kjlto'
  ),(
    56,
    6,
    'ctmti',
    'dpxfp',
    '+82 10-0000-0000',
    90000,
    'mvjue'
  ),(
    57,
    8,
    'ywjmi',
    'odlhy',
    '+82 10-0000-0000',
    60000,
    'fmugj'
  ),(
    58,
    1,
    'tlcxf',
    'tkovw',
    '+82 10-0000-0000',
    75000,
    'ivxgt'
  ),(
    59,
    8,
    'hhnoq',
    'qcwtc',
    '+82 10-0000-0000',
    25000,
    'caxjc'
  ),(
    60,
    3,
    'wvzbf',
    'vdbop',
    '+82 10-0000-0000',
    50000,
    'bftsl'
  ),(
    61,
    10,
    'kvocz',
    'fgurw',
    '+82 10-0000-0000',
    30000,
    'tstjk'
  ),(
    62,
    8,
    'ynjmg',
    'mcsdw',
    '+82 10-0000-0000',
    5000,
    'ddday'
  ),(
    63,
    5,
    'xdjih',
    'rrlyd',
    '+82 10-0000-0000',
    65000,
    'gllxv'
  ),(
    64,
    6,
    'bphyn',
    'mxsmw',
    '+82 10-0000-0000',
    35000,
    'qgoxy'
  ),(
    65,
    6,
    'lovzc',
    'ukvhq',
    '+82 10-0000-0000',
    55000,
    'dyqcu'
  ),(
    66,
    4,
    'eftbl',
    'obiuy',
    '+82 10-0000-0000',
    25000,
    'gbkui'
  ),(
    67,
    5,
    'wwbyr',
    'okagg',
    '+82 10-0000-0000',
    75000,
    'zogyk'
  ),(
    68,
    2,
    'ykoss',
    'yxpks',
    '+82 10-0000-0000',
    10000,
    'hypdg'
  ),(
    69,
    2,
    'edfst',
    'drjjf',
    '+82 10-0000-0000',
    75000,
    'ujwcp'
  ),(
    70,
    6,
    'msefr',
    'niodx',
    '+82 10-0000-0000',
    60000,
    'etmww'
  ),(
    71,
    9,
    'uupwm',
    'xbkfs',
    '+82 10-0000-0000',
    35000,
    'xsgtt'
  ),(
    72,
    2,
    'myfer',
    'crcfk',
    '+82 10-0000-0000',
    15000,
    'ubydl'
  ),(
    73,
    7,
    'qoxqq',
    'yfbvt',
    '+82 10-0000-0000',
    95000,
    'cddvf'
  ),(
    74,
    5,
    'kkrrt',
    'wuqjj',
    '+82 10-0000-0000',
    45000,
    'ltkqc'
  ),(
    75,
    8,
    'gkdpx',
    'xafkp',
    '+82 10-0000-0000',
    35000,
    'wxwon'
  ),(
    76,
    4,
    'ybifq',
    'lojpr',
    '+82 10-0000-0000',
    60000,
    'fswhr'
  ),(
    77,
    5,
    'bkxfi',
    'blbaf',
    '+82 10-0000-0000',
    75000,
    'mbpra'
  ),(
    78,
    8,
    'fjgqi',
    'dclqt',
    '+82 10-0000-0000',
    15000,
    'sbrin'
  ),(
    79,
    5,
    'soviy',
    'aokqm',
    '+82 10-0000-0000',
    60000,
    'zzeuc'
  ),(
    80,
    3,
    'nklrn',
    'bpknr',
    '+82 10-0000-0000',
    30000,
    'kbioi'
  ),(
    81,
    6,
    'nyvzl',
    'ujtay',
    '+82 10-0000-0000',
    15000,
    'kftmg'
  ),(
    82,
    2,
    'kecmc',
    'aierc',
    '+82 10-0000-0000',
    75000,
    'lrkjr'
  ),(
    83,
    3,
    'zgrfj',
    'vrpwr',
    '+82 10-0000-0000',
    70000,
    'qkzuy'
  ),(
    84,
    8,
    'yheji',
    'svfwn',
    '+82 10-0000-0000',
    10000,
    'jonru'
  ),(
    85,
    5,
    'xcvap',
    'yjupp',
    '+82 10-0000-0000',
    40000,
    'mcqkx'
  ),(
    86,
    3,
    'qoemp',
    'xeljm',
    '+82 10-0000-0000',
    90000,
    'xlbxt'
  ),(
    87,
    8,
    'gvwmg',
    'vzrsg',
    '+82 10-0000-0000',
    75000,
    'csixp'
  ),(
    88,
    1,
    'prtsx',
    'bbngi',
    '+82 10-0000-0000',
    10000,
    'zvune'
  ),(
    89,
    7,
    'bmvev',
    'emkno',
    '+82 10-0000-0000',
    85000,
    'byhus'
  ),(
    90,
    5,
    'qkrlf',
    'xofdk',
    '+82 10-0000-0000',
    10000,
    'lvast'
  ),(
    91,
    3,
    'exzos',
    'uzsht',
    '+82 10-0000-0000',
    20000,
    'bgybv'
  ),(
    92,
    8,
    'vekey',
    'uzhvz',
    '+82 10-0000-0000',
    60000,
    'mtwdx'
  ),(
    93,
    9,
    'byobp',
    'xcsrs',
    '+82 10-0000-0000',
    65000,
    'cnudg'
  ),(
    94,
    3,
    'vqjfa',
    'dhmol',
    '+82 10-0000-0000',
    60000,
    'pghpp'
  ),(
    95,
    8,
    'mgjqi',
    'pcsxn',
    '+82 10-0000-0000',
    95000,
    'kpuow'
  ),(
    96,
    5,
    'ifeog',
    'crrao',
    '+82 10-0000-0000',
    85000,
    'bmulu'
  ),(
    97,
    6,
    'zzcgm',
    'fwksi',
    '+82 10-0000-0000',
    75000,
    'vdsyy'
  ),(
    98,
    1,
    'rkcgs',
    'mruoh',
    '+82 10-0000-0000',
    60000,
    'mbfko'
  ),(
    99,
    3,
    'ifshn',
    'tphrx',
    '+82 10-0000-0000',
    85000,
    'bwwjr'
  ),(
    100,
    5,
    'acxyr',
    'dmfmg',
    '+82 10-0000-0000',
    45000,
    'tkccj'
  );