<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class company extends Model
{
    use HasFactory;
    use Userstamps;

    public $table = "company";

     public function company()
     {
        return $this->hasOne(country::class);
     }

    public function branches()
    {
       return $this->hasMany(branch::class);
    }

}
