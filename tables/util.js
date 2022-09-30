Object.assign(tables, {
    name_beginning : [
        undefined,
        undefined,
        undefined,
        () => '',
        () => 'A',
        () => 'Be',
        () => 'De',
        () => 'El',
        () => 'Fa',
        () => 'Jo',
        () => 'Ki',
        () => 'La',
        () => 'Ma',
        () => 'Na',
        () => 'O',
        () => 'Pa',
        () => 'Re',
        () => 'Se',
        () => 'Si',
        () => 'Ta',
    ],

    name_middle : [
        () => 'Bar',
        () => 'Ched',
        () => 'Dell',
        () => 'Far',
        () => 'Gran',
        () => 'Hal',
        () => 'Jen',
        () => 'Kel',
        () => 'Lim',
        () => 'Mor',
        () => 'Net',
        () => 'Penn',
        () => 'Quil',
        () => 'Rond',
        () => 'Sark',
        () => 'Shen',
        () => 'Tur',
        () => 'Vash',
        () => 'Yor',
        () => 'Zen',
    ],

    name_end : [
        () => '',
        () => 'A',
        () => 'Ac',
        () => 'Ai',
        () => 'Al',
        () => 'Am',
        () => 'An',
        () => 'Ar',
        () => 'Ea',
        () => 'El',
        () => 'Er',
        () => 'Ess',
        () => 'Ett',
        () => 'Ic',
        () => 'Id',
        () => 'Il',
        () => 'In',
        () => 'Is',
        () => 'Or',
        () => 'Us',
    ],

    name : [
        () => {
            var name = travelang.parse('roll name_beginning') +
                    travelang.parse('roll name_middle') +
                    travelang.parse('roll name_end');
            
            return name[0].toUpperCase() + name.slice(1).toLowerCase();
        }
    ],
});