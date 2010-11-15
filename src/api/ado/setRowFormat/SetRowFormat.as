package api.ado.setRowFormat
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	import api.vos.ado.SetRowFormatVO;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_setRowFormat.html Northcode Help Documentation
	 */
	public class SetRowFormat extends Ado
	{
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>SetRowFormatVO</code>
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
		 *
		 *
                 *
		 * @param format
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