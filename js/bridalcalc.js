
function BridalCalc(options){
	
	var defaults	=	{
		
		config: "ajax/categories.json",
		email:  "ajax/email.php"
		
	};
	
	this.options = $.extend(true, defaults, options);

	return this;
	
	
}

BridalCalc.prototype.init			=	function(){
	
	$('a.question-tooltip').tooltip();

	$('#expand-all').on('click', function(e) {

		$(this).hide();
		$('#collapse-all').show();

		$('.collapse').collapse('show');

		$('.icon-custom').addClass('up');
		$('.icon-custom').removeClass('down');

	});

	$('#collapse-all').on('click', function(e) {

		$(this).hide();
		$('#expand-all').show();
		$('.collapse').collapse('hide');

		$('.icon-custom').addClass('down');
		$('.icon-custom').removeClass('up');

	}); 
	
	
	//load configuration data
	$.ajax({

		type : "get",
		url : this.options.config,
		dataType : "json",
		async : true,
		cache : false,
		success : $.proxy(function(data, xhr_status) {

			this.build_categories(data);

		},this),
		error : function(xhr, desc, err) {

			alert(desc);

		},
		complete : function(data, xhr_status) {

		}
	});
	//end ajax
	
	//bind to reset button
	$('#reset').on('click', $.proxy(function(e) {

		this.reset_calc();

	},this));
	
	//bind to go button
	$('#go').on('click', $.proxy(function(e) {
		//alert('go');
		var budget = this.format_currency($('#budget').val());

		if (parseInt(budget) > 0) {

			this.calc_estimates(budget);

			$('#budget').val(budget);

		}

		this.calc_total();

	},this));
	
	//bind to guests input
	$('#guests').on('blur', $.proxy(function() {

		var budget = this.format_currency($('#budget').val());

		if (parseInt(budget) > 0) {

			this.calc_estimates(budget);
			$('#budget').val(budget);
		}

		this.calc_total();

	},this));
	
	//bind to guests input - enter keypress
	$('#guests').keypress($.proxy(function(e) {

		if (e.which == 13) {

			var budget = this.format_currency($('#budget').val());

			if (parseInt(budget) > 0) {

				this.calc_estimates(budget);
				$('#budget').val(budget);

			}

			this.calc_total();

		}
	},this)); 
	
	//bind to email button
	$('#email').on('click',$.proxy(function(){
		
		this.email();		
		
	},this));
	
	//bind to pdf button
	$('#pdf').on('click',$.proxy(function(){
		
		this.pdf();		
		
	},this));
	
	//bind to print button
	$('#print').on('click',$.proxy(function(){
		
		this.print();		
		
	},this));

	
};// .init()

BridalCalc.prototype.build_categories			=	function(data){
                
	$.each(data.categories, $.proxy(function(i, category) {

		var group = this.build_category(category);

		$('#category-list').append(group);

	},this)); 

                
};//.build_categories


BridalCalc.prototype.build_category				=	function(category) {

	//alert(category.name);
	var wrapper = $('<div class="accordion"></div>')
	var group = $('<div class="accordion-group" data-role="category"></div>');
	var heading = $('<div class="accordion-heading"></div>');
	var row = $('<div class="row-fluid"></div>');
	var span1 = $('<div class="span4"></div>');
	var span2 = $('<div class="span5"></div>');
	var span3 = $('<div class="span3"></div>');
	var toggle = $('<a class="accordion-toggle" data-toggle="collapse" data-parent="" href=""></a>');
	var estimate = $('<input data-role="category-estimate" type="text" class="input-small" disabled="disabled">');
	var per_person = $('<input data-role="category-per-person" type="text" class="input-mini" disabled="disabled" value="0.00">');
	var total = $('<input data-role="category-total" type="text" class="input-small">');
	var body = $('<div id="" class="accordion-body collapse in"></div>');
	var inner = $('<div class="accordion-inner"></div>');

	var tips_controls = $('<div class="tips-controls style="display:none;"></div>');
	var tips_show = $('<div style="display:none"  class="tips-show">+ Show tips</div>');
	var tips_hide = $('<div style="display:none" class="tips-hide">- Hide tips</div>');

	var tips = $('<div class="row-fluid tips"></div>');

	$(tips_show).on('click', function(e) {

		$(this).hide();
		$(tips_hide).show();
		$(tips).show();
	});

	$(tips_hide).on('click', function(e) {

		$(this).hide();
		$(tips_show).show();
		$(tips).hide();
	});

	$(tips_controls).append(tips_show, tips_hide);

	var icon = $('<i class="icon icon-custom"></i>');

	$(estimate).val('0.00');
	$(total).val('0.00');

	$(total).on('blur', $.proxy(function(e) {

		var value = this.format_currency($(total).val());

		$(total).val(value);

		this.calc_total();

	},this));

	$(total).keypress($.proxy(function(e) {

		if (e.which == 13) {

			var value = this.format_currency($(total).val());

			$(total).val(value);

			this.calc_total();

		}
	},this));

	var cat_name = category.name;

	cat_name = cat_name.replace(/\s+/g, '-').toLowerCase();
	cat_name = cat_name.replace(/\&+/g, 'and');

	$(wrapper).attr('id', "category-list-" + cat_name);
	$(toggle).attr('data-parent', "#category-list-" + cat_name);
	$(toggle).attr('href', "#category-" + cat_name);
	$(toggle).append(icon, category.name);
	$(body).attr('id', "category-" + cat_name);

	$(body).on('show', function(e) {

		$(icon).removeClass('down');
		$(icon).addClass('up');

	});

	$(body).on('hide', function(e) {

		$(icon).removeClass('up');
		$(icon).addClass('down');

	});

	$(group).attr('data-config', JSON.stringify(category));

	$(span1).append(toggle, tips_controls);

	var prepend = $('<div class="input-prepend"></div>');
	var addon = $('<span class="add-on pull-left">$</span>');

	$(prepend).append(addon, estimate);

	$(span2).append(prepend);

	if (category.per_person) {

		var prepend3 = $('<div class="input-prepend input-append"></div>');
		var addon3 = $('<span class="add-on pull-left">$</span>');

		var addon4 = $('<span class="add-on appended">per person</span>');

		$(prepend3).append(addon3, per_person, addon4);

		$(span2).append(prepend3);

	}

	var prepend2 = $('<div class="input-prepend"></div>');
	var addon2 = $('<span class="add-on pull-left">$</span>');

	$(prepend2).append(addon2, total);

	$(span3).append(prepend2);

	$(row).append(span1, span2, span3);

	$(heading).append(row);

	if (category.tips !== "undefined") {

		$(tips).append('<div class="span12">' + category.tips + '</div>');

		$(heading).append(tips);
	}

	$.each(category.items, $.proxy(function(i, item) {

		var item_row = this.build_item(item);

		$(inner).append(item_row);

	},this));

	$(inner).append(this.build_add_item());

	$(body).append(inner);

	$(group).append(heading, body);

	$(wrapper).append(group);

	return wrapper;

};// .build_category()

BridalCalc.prototype.build_item				=	function(item){
                

	var row = $('<div class="row-fluid" data-role="category-item"></div>');
	var span1 = $('<div class="span4 item-name"></div>');
	var span2 = $('<div class="span5"></div>');
	var span3 = $('<div class="span3"></div>');
	var cost = $('<input data-role="item-cost" type="number" class="input-small">');
	var prepend = $('<div class="input-prepend"></div>');
	var addon = $('<span class="add-on pull-left">$</span>');

	$(cost).val('0.00');

	$(span1).html("- " + item);
	$(span1).attr('data-value', item);

	$(prepend).append(addon, cost);

	$(span3).append(prepend);

	$(row).append(span1, span2, span3);

	$(cost).on('blur', $.proxy(function(e) {

		var category = $(cost).closest('[data-role="category"]');

		this.calc_category_total(category);


	},this));

	$(cost).keypress($.proxy(function(e) {

		if (e.which == 13) {

			var category = $(cost).closest('[data-role="category"]');

			this.calc_category_total(category);

		}
	},this));

	return row;
              
};// .build_item()


BridalCalc.prototype.build_custom_item			=	function(item, amt){

	var row = $('<div class="row-fluid" data-role="category-item" data-custom="item"></div>');
	var span1 = $('<div class="span4 item-name" data-value=""></div>');
	var span2 = $('<div class="span5"></div>');
	var span3 = $('<div class="span3"></div>');
	var cost = $('<input data-role="item-cost" type="number" class="input-small">');
	var prepend = $('<div class="input-prepend"></div>');
	var addon = $('<span class="add-on pull-left">$</span>');

	$(cost).val(amt);

	$(span1).html("- " + item);
	$(span1).attr('data-value', item);

	var remove = $('<i class="icon icon-remove pull-right" style="cursor:pointer;"></i>');

	$(remove).on('click', $.proxy(function(e) {

		var category = $(row).closest('[data-role="category"]');

		$(row).remove();

		this.calc_category_total(category);

		//calc_total();

	},this));

	var edit = $('<i class="icon icon-pencil pull-right" style="margin-right:5px;cursor:pointer;"></i>');

	$(edit).on('click', $.proxy(function(e) {

		var item_name = $(span1).attr('data-value');
		var item_amt = this.format_currency($(cost).val());

		var span = $('<div class="span12"></div>');
		var input = $('<input data-role="new-item" type="text" class="input-small new-item">');
		var button = $('<button><i class="icon icon-white icon-ok"></i></button>');
		var cancel = $('<button class="cancel"><i class="icon icon-white icon-remove"></i></button>');

		$(input).val(item_name);

		$(button).on('click', $.proxy(function(e) {

			//alert($(input).val());

			var item = $(input).val();

			if (item.length > 0) {

				var new_row = this.build_custom_item(item, item_amt);

				$(row).before(new_row);

				$(row).remove();

			}

		},this));

		$(cancel).on('click', $.proxy(function(e) {

			var new_row = this.build_custom_item(item_name, item_amt);

			$(row).before(new_row);
			$(row).remove();

		},this));

		$(input).keypress($.proxy(function(e) {

			if (e.which == 13) {

				var item = $(input).val();

				if (item.length > 0) {

					var new_row = this.build_custom_item(item, item_amt);

					$(row).before(new_row);

					$(row).remove();

				}

			}
		},this));

		$(span).append(input, button, cancel);
		$(row).html('');
		$(row).append(span);

	},this));

	$(span1).append(remove, edit);

	$(prepend).append(addon, cost);

	$(span3).append(prepend);

	$(row).append(span1, span2, span3);

	$(cost).on('blur', $.proxy(function(e) {

		var category = $(cost).closest('[data-role="category"]');

		this.calc_category_total(category);
		//calc_total();
	},this));

	$(cost).keypress($.proxy(function(e) {

		if (e.which == 13) {

			var category = $(cost).closest('[data-role="category"]');

			this.calc_category_total(category);
			//calc_total();
		}
	},this));

	return row;

};// .build_custom_item()

BridalCalc.prototype.build_add_item				=	function(){
                

	var row = $('<div class="row-fluid"></div>');
	var span1 = $('<div class="span4 add-item"></div>');
	var span2 = $('<div class="span5"></div>');
	var span3 = $('<div class="span3"></div>');
	var a = $('<a></a>');

	$(a).html("+ Add Item");

	$(a).click($.proxy(function() {

		//alert('click');
		var item = this.add_item();

		$(row).before(item);

	},this));

	$(span1).append(a);

	$(row).append(span1, span2, span3);

	return row;
               
};//.build_add_item()

BridalCalc.prototype.add_item				=	function(){

	var row = $('<div class="row-fluid" data-role="category-item"></div>');
	var span1 = $('<div class="span12"></div>');

	var input = $('<input data-role="new-item" type="text" class="input-small new-item">');
	var button = $('<button><i class="icon icon-white icon-ok"></i></button>');
	var cancel = $('<button class="cancel"><i class="icon icon-white icon-remove"></i></button>');

	$(button).on('click', $.proxy(function(e) {

		//alert($(input).val());

		var item = $(input).val();

		if (item.length > 0) {

			var new_row = this.build_custom_item(item, '0.00');

			$(row).before(new_row);

			$(row).remove();

		}

	},this));

	$(cancel).on('click', function(e) {

		$(row).remove();

	});

	$(input).keypress($.proxy(function(e) {

		if (e.which == 13) {

			var item = $(input).val();

			if (item.length > 0) {

				var new_row = this.build_custom_item(item, '0.00');

				$(row).before(new_row);

				$(row).remove();

			}

		}
	},this));

	$(span1).append(input, button, cancel);

	$(row).append(span1);

	return row;
             
};//.add_item()

BridalCalc.prototype.format_currency			=	function(value){
                

	if (!this.is_numeric(value)) {

		//alert('non numeric value supplied');
		return "0.00";
	}

	if (value.length < 1) {

		return "0.00";
	}

	value = new String(value);

	value = value.replace(/\,+/g, '');

	var parts = value.split('.');

	if (parts.length === 1) {

		value = parts[0] + '.00';

		return value;

	} else if (parts.length === 2) {

		if (parts[1].length === 1) {

			value = parts[0] + '.' + parts[1] + '0';
			return value;

		} else {

			return value
		}

	} else {

		return value;
	}
               
};//.format_currency()

BridalCalc.prototype.is_numeric			=	function(value){
                
	value = new String(value);

	value = value.replace(/\,+/g, '');
	value = value.replace(/\.+/g, '');

	var start_len = value.length;

	value = value.replace(/\D/, '');

	var end_len = value.length;

	if (start_len !== end_len) {

		return false;
	} else {
		return true;
	}
               
};//.is_numeric()

BridalCalc.prototype.calc_estimates			=	function(budget){
                

	var categories = $('[data-role="category"]');

	$.each(categories, $.proxy(function(i, category) {

		var data = JSON.parse($(category).attr('data-config'));

		var amt = this.format_currency(parseFloat(budget) * parseFloat(data.percent));

		$(category).find('[data-role="category-estimate"]').val(amt);

		if (data.per_person) {

			if (parseInt($('#guests').val()) > 0) {

				var per_person = parseInt(amt) / parseInt($('#guests').val());

			} else {

				var per_person = 0;

			}

			$(category).find('[data-role="category-per-person"]').val(this.format_currency(per_person));

		}

		//alert(amt);

	},this)); 

                
};//.calc_estimates()

BridalCalc.prototype.calc_category_total			=	function(category){
                

	var total = 0;
	var items = $(category).find('[data-role="item-cost"]');

	$.each(items, $.proxy(function(i, item) {

		var value = this.format_currency($(item).val());
		total = total + parseFloat(value);

		$(item).val(this.format_currency(value));

	},this));

	total = this.format_currency(total);

	var estimate = $(category).find('[data-role="category-estimate"]').val();

	$(category).find('[data-role="category-total"]').removeClass('budget-error');
	$(category).find('[data-role="category-total"]').removeClass('budget-success');

	if (parseFloat(estimate) < parseFloat(total)) {

		$(category).find('[data-role="category-total"]').addClass('budget-error');

	} else {

		$(category).find('[data-role="category-total"]').addClass('budget-success');

	}

	$(category).find('[data-role="category-total"]').val(total);

	//always recalculate total
	this.calc_total(); 

                
};//.calc_category_total()

BridalCalc.prototype.calc_total			=	function(){

	var categories = $('[data-role="category"]');
	var total = 0;

	$.each(categories, $.proxy(function(i, category) {

		//calc_category_total(category);

		var amt = parseFloat($(category).find('[data-role="category-total"]').val());

		total = total + amt;

		var estimate = $(category).find('[data-role="category-estimate"]').val();

		$(category).find('[data-role="category-total"]').removeClass('budget-error');
		$(category).find('[data-role="category-total"]').removeClass('budget-success');

		if (parseFloat(estimate) < parseFloat(amt)) {

			$(category).find('[data-role="category-total"]').addClass('budget-error');

		} else {

			$(category).find('[data-role="category-total"]').addClass('budget-success');

		}

	},this));

	$('#total-cost').val(this.format_currency(total));

	var budget = parseFloat($('#budget').val());

	$('#total-cost').removeClass('budget-error');
	$('#total-cost').removeClass('budget-success');

	if (parseFloat(budget) < parseFloat(total)) {

		$('#total-cost').addClass('budget-error');

	} else {

		$('#total-cost').addClass('budget-success');

	}

           
};//.calc_total()

BridalCalc.prototype.reset_calc			=	function(){

	$('#budget').val('0.00');
	$('#guests').val('0');
	$('#total-cost').val('0.00');
	$('[data-role="category-total"]').val('0.00');
	$('[data-role="category-estimate"]').val('0.00');
	$('[data-role="item-cost"]').val('0.00');
	$('[data-role="category-per-person"]').val('0.00');

	$('[data-custom="item"]').remove();

	$('.budget-error').removeClass('budget-error');
	$('.budget-success').removeClass('budget-success'); 

};//.reset_calc

BridalCalc.prototype.getJSON			=	function(){
	
	var json			=	{};
	
	json.budget			=	$('#budget').val();
	json.guests			=	$('#guests').val();
	json.total			=	$('#total-cost').val();
	
	
	json.categories		=	[];
	
	var categories		=	$('[data-role="category"]');
	
	$.each(categories,function(i,category){
		
		var cat			=	{};
		
		var data		=	JSON.parse($(category).attr('data-config'));
		
		cat.name		=	data.name;
		cat.total		=	$(category).find('[data-role="category-total"]').val();
		cat.items		=	[];
		
		var items		=	$(category).find('[data-role="category-item"]');
		
		$.each(items,function(i,item){
			
			var itm			=	{};
			
			
			itm.name		=	$(item).find('.item-name').attr('data-value');
			itm.cost		=	$(item).find('[data-role="item-cost"]').val();
			
			cat.items.push(itm);
			
			
		});
		
		if(data.per_person){
			
			cat.per_person		=	$(category).find('[data-role="category-per-person"]').val();
			
		}
		
		cat.estimate			=	$(category).find('[data-role="category-estimate"]').val();
		
		
		json.categories.push(cat);
		
	});
	
	return json;
	
};//.getJSON();

BridalCalc.prototype.email				=	function(){
	
	var json		=	this.getJSON();
	
	$('#emailModal').modal('show');
	
	$('#send-email').on('click',$.proxy(function(){
		
		var email		=	$('#email-address').val();

		
		json.email		=	email;
		
		$.ajax({
	
			type : "post",
			url : this.options.email,
			dataType : "html",
			data: {
					json: JSON.stringify(json),
					email: email	
			},
			async : true,
			cache : false,
			success : $.proxy(function(data, xhr_status) {
				
				if(data === "ok"){
					
					$('#email-alert').html('').hide();
					$('#emailModal').modal('hide');	
					
				}
				else{
					
					$('#email-alert').html(data).show();
					
				}
				
				//alert(data)
	
			},this),
			error : function(xhr, desc, err) {
	
				$('#email-alert').html(desc).show();
	
			},
			complete : function(data, xhr_status) {
	
			}
		});
		//end ajax	
		
		
	},this));

	
	
	
};//.email()

BridalCalc.prototype.pdf				=	function(){
	
	var json					=	this.getJSON();
	
	$('#pdf-json').val(JSON.stringify(json));
	
	$('#pdf-form').submit();
	
};//.pdf()

BridalCalc.prototype.print				=	function(){

	window.print(); 
	
};//.print()
