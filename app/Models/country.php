<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\branch;

class country extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "country";

    public function branches()
    {
       return $this->hasMany(branch::class);
    }

    public function languages()
    {
       return $this->belongsToMany(languages::class);
    }
}
