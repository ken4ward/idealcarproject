<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Wildside\Userstamps\Userstamps;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOneOrMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class fuel_entries extends Model
{
    use HasFactory;
    use Userstamps;
    public $table = "fuel_entries";

    public function fuel_cards()
    {
        return $this->belongsTo(fuel_cards::class);
    }
}
