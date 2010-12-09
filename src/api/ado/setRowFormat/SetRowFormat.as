package api.ado.setRowFormat
{
	import api.ado.Ado;

	import api.events.ado.setRowFormat.SetRowFormatEvent;

	import api.vos.ado.SetRowFormatVO;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 * Select the format of returned row data.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setRowFormat.html Northcode Help Documentation
	 */
	public class SetRowFormat extends Ado
	{
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>SetRowFormatVO.XML</code>
		 */
		public var format:String = SetRowFormatVO.XML;
		
		/**
		 * Constructor for Ado.SetRowFormat()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setRowFormat.html Northcode Help Documentation
		 */
		public function SetRowFormat(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Select the format of returned row data.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setRowFormat.html Northcode Help Documentation
		 */
		public function setRowFormat():void
		{
			ssCore.Ado.setRowFormat( {format:format}
									,{callback:actionComplete, errorSTR:"setRowFormatError", code:"16022"} );
		}
	}
}