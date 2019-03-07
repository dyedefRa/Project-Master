<script>
    $(document).ready(function () {

        $('#regionDirectorId').on('change', function () {
            regionDirectorId = $('#regionDirectorId option:selected').val();
            
            var options = $("#regionId");
            var storesdrpdwn = $("#storesId");
            if (regionDirectorId > 0) {
                options.attr("disabled", true);
            } else {
                options.removeAttr("disabled")
            }
            $.ajax({
                type: 'POST',
                dataType: "json",
                url: '@Url.Action("GetStoreAndRegionByDirectorId")',
                data: { id: regionDirectorId },
                success: function (data) {
                    var region = data.Region;
                    var stores = data.Stores;
                    options.empty();
                    options.select2();
                    options.append("<option> " +"@Html.Translate("Choose")"+" </option>");
                    storesdrpdwn.empty();
                    storesdrpdwn.select2();
                    storesdrpdwn.append("<option> "+"@Html.Translate("Choose")"+" </option>");
                    if (data.Region === null) {
                        return;
                    }
                    options.append("<option value='" + region.Id + "'>" + region.RegionName + "</option>");
                    options.select2("val", region.Id);

                    $.each(stores, function (i, item) {
                        storesdrpdwn.append("<option value='" + item.Id + "'>" + item.StoreName + "</option>").attr("selected", this.Selected);
                        //if (this.Selected) storesdrpdwn.select2("val", item.Id);
                        if (this.Selected) storesdrpdwn.select2("val", this.Value);

                    });
                    options.trigger('change');
                }
            });
            storesdrpdwn.trigger('change');
        });
    });
</script>