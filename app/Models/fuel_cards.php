<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class fuel_cards extends Model
{
    use HasFactory;
    use Userstamps;

    public $table = "fuel_cards";

    public function fuel_cards()
    {
         return $this->belongsTo(branch::class, 'branch_id');
    }
    public function fuel_entries()
    {
        return $this->hasMany(fuel_entries::class, 'fuel_card_id');
    }
}
