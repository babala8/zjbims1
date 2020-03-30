export const MENUS = {
    '/menus': [
        {
            'id': 'system',
            'text': '系统管理',
            'icon': 'zijin-icon-options',
            'menuType': 0,
            'auth': 'A',
            'children': [
                {
                    'id': 'system.menuDefine',
                    'text': '菜单定义',
                    'link': '/system/menuDefine',
                    'menuType': 1,
                    'auth': 'A01'
                },
                {
                    'id': 'system.user',
                    'text': '用户信息',
                    'link': '/system/user'
                },
                {
                    'id': 'system.org',
                    'text': '机构信息',
                    'link': '/system/org'
                },
                {
                    'id': 'system.role',
                    'text': '角色权限',
                    'link': '/system/role'
                },
                {
                    'id': 'system.params',
                    'text': '参数管理',
                    'link': '/system/params'
                },
                {
                    'id': 'baseInformation.devVendor',
                    'text': '设备品牌',
                    'link': '/baseInformation/devVendor'
                },
                {
                    'id': 'baseInformation.devType',
                    'text': '设备型号',
                    'link': '/baseInformation/devType'
                },
                {
                    'id': 'baseInformation.devCompany',
                    'text': '设备维护商',
                    'link': '/baseInformation/devCompany'
                },
                {
                    'id': 'baseInformation.devInformation',
                    'text': '设备信息',
                    'link': '/baseInformation/devInformation'
                },
                {
                    'id': 'system.vault',
                    'text': '金库信息',
                    'link': '/system/vault'
                },
                {
                    'id': 'baseInformation.timedTask',
                    'text': '定时任务查询',
                    'link': '/baseInformation/timedTask'
                }
            ]
        },
        {
            'text': '计划管理',
            'id': 'addnotes',
            'icon': 'zijin-icon-Add-money',
            'children': [
                {
                    'id': 'addnotes.addnotes-plan',
                    'text': '加钞计划管理',
                    'link': '/addnotes/addnotes-plan'
                },
                {
                    'text': 'ATM加钞参数管理',
                    'id': 'addnotes.param.manage',
                    'children': [
                        {
                            'id': 'addnotes.devconfig',
                            'text': '设备选择参数配置',
                            'link': '/addnotes/devconfig'
                        },
                        {
                            'id': 'addnotes.spDateCoeff',
                            'text': '特殊日期配钞设置',
                            'link': '/addnotes/spDateCoeff'
                        },
                        {
                            'id': 'addnotes.special-rule',
                            'text': '特殊规则管理',
                            'link': '/addnotes/special-rule'
                        },
                        {
                            'id': 'addnotes.devRuleExec',
                            'text': '执行特色规则管理',
                            'link': '/addnotes/devRuleExec'
                        },
                        {
                            'id': 'addnotes.regionAddnotesCoeff',
                            'text': '区域配钞设置',
                            'link': '/addnotes/regionAddnotesCoeff'
                        },
                        {
                            'id': 'addnotes.distspecialDateCoeff',
                            'text': '区域特殊日期配钞',
                            'link': '/addnotes/distspecialDateCoeff'
                        }
                    ]
                },
                {
                    'text': '网点调拨计划',
                    'id': 'branch.plan.manage',
                    'children': [
                        {
                            'id': 'branch.cash-allot',
                            'text': '网点限额管理',
                            'link': '/branch/cash-allot'
                        },
                        {
                            'id': 'branch.cash-allot',
                            'text': '现金调拨申请',
                            'link': '/branch/cash-allot'
                        },
                        {
                            'id': 'branch.cash-review',
                            'text': '现金调拨复核',
                            'link': '/branch/role'
                        },
                        {
                            'id': 'branch.cash-approval',
                            'text': '现金调拨支(分)行审批',
                            'link': '/branch/role'
                        },
                        {
                            'id': 'branch.cash-booked',
                            'text': '现金调拨入账',
                            'link': '/branch/role'
                        },
                        {
                            'id': 'branch.cash-checked',
                            'text': '现金调拨网点确认',
                            'link': '/branch/role'
                        },
                        {
                            'id': 'branch.cash-query',
                            'text': '现金调拨查询',
                            'link': '/branch/role'
                        },
                        {
                            'id': 'branch.cash-errorHandling',
                            'text': '现金调拨差错处理',
                            'link': '/branch/role'
                        },
                        {
                            'id': 'branch.registrationForm',
                            'text': '寄库款箱登记单',
                            'link': '/branch/role'
                        }
                    ]
                },
                {
                    'text': '派工任务管理',
                    'serverID': 'C04',
                    'id': 'dispatching.job.manage',
                    'icon': 'zijin-icon-Secondary-icon',
                    'children': [
                        {
                            'id': 'addnoteOperation.dispatch',
                            'text': '加钞任务单管理',
                            'link': '/addnoteOperation/dispatch'
                        },
                        {
                            'id': 'addnoteOperation.dailyInput',
                            'text': '日结单录入',
                            'link': '/addnoteOperation/dailyInput'
                        },
                        {
                            'id': 'addnoteOperation.maintenanceTask',
                            'text': '维护任务单管理',
                            'link': '/addnoteOperation/maintenanceTask'
                        },
                        {
                            'id': 'addnoteOperation.maintenanceInput',
                            'text': '维护任务单录入',
                            'link': '/addnoteOperation/maintenanceInput'
                        },
                        {
                            'id': 'branch.user',
                            'text': '网点调拨任务管理',
                            'link': '/branch/role'
                        }
                    ]
                }
            ]
        }
    ]
};
