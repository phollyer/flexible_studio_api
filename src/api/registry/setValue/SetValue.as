package api.registry.setValue
{
	import api.events.registry.setValue.SetValueEvent;

	import api.registry.Registry;

	import api.vos.registry.ValueVO;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Write a value to a specified value name associated with a registry key.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_setValue.html Northcode Help Documentation
	*/
	public class SetValue extends Registry
	{				
		// Required
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var settings:ValueVO = new ValueVO();
		
		/**
		* Constructor for Registry.SetValue()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_setValue.html Northcode Help Documentation
		*/
		public function SetValue(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Write a value to a specified value name associated with a registry key.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Registry_setValue.html Northcode Help Documentation
		*/
		public function setValue():void
		{
			ssCore.Registry.setValue( settings.createObject()
									,{callback:actionComplete, errorSTR:"setValueError", code:"33005"} );
		}
	}
}