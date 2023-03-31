<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class languages extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "languages";

    public function country()
    {
       return $this->belongsToMany(country::class);
    }
    public function pages()
        {
           return $this->belongsToMany(pages::class);
        }
}
