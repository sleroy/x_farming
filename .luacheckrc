unused_args = false
allow_defined_top = true
max_line_length = false

exclude_files = {
    './scripts',
    './bin',
    './logs',
    './node_modules',
    './sounds',
    './textures',
    './models',
    './docs',
    './locale',
    './types',
    './assets',
}

globals = {
    'x_farming',
    'mobs',
    'x_default'
}

read_globals = {
    'DIR_DELIM', 'INIT',

    'minetest', 'core',
    'dump', 'dump2',

    'Raycast',
    'Settings',
    'PseudoRandom',
    'PerlinNoise',
    'VoxelManip',
    'SecureRandom',
    'VoxelArea',
    'PerlinNoiseMap',
    'PcgRandom',
    'ItemStack',
    'AreaStore',

    'vector',
    'unpack',

    table = {
        fields = {
            'copy',
            'indexof',
            'insert_all',
            'key_value_swap',
            'shuffle',
        }
    },

    string = {
        fields = {
            'split',
            'trim',
        }
    },

    math = {
        fields = {
            'hypot',
            'sign',
            'factorial'
        }
    },

    'hbhunger',
    'stairs',
    'default',
    'mcl_farming',
    'mcl_potions',
    'hunger_ng',
    'mcl_stairs',
}
