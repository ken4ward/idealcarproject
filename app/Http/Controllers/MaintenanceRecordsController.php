<?php

namespace App\Http\Controllers;

use App\Http\Requests\Storemaintenance_recordsRequest;
use App\Http\Requests\Updatemaintenance_recordsRequest;
use App\Models\maintenance_records;

class MaintenanceRecordsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Storemaintenance_recordsRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(maintenance_records $maintenance_records)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(maintenance_records $maintenance_records)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Updatemaintenance_recordsRequest $request, maintenance_records $maintenance_records)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(maintenance_records $maintenance_records)
    {
        //
    }
}
